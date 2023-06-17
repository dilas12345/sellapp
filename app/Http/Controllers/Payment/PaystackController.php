<?php

namespace App\Http\Controllers\Payment;

use App\Http\Controllers\Controller;
use App\User;
use App\Plan;
use App\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Paystack;
use App\Transaction as TransactionModel;
use Illuminate\Support\Facades\DB;

class PaystackController extends Controller
{
    public function payWithPaystack(Request $request, $planId)
    {
        if (Auth::check()) {
            $config = DB::table('config')->get();
            $userData = User::where('id', Auth::user()->id)->first();

            $plan_details = Plan::where('plan_id', $planId)->where('status', 1)->first();

            if ($plan_details == null) {
                return view('errors.404');
            } else {
                // $amountToBePaid = ((int)($plan_details->plan_price) * (int)($config[25]->config_value) / 100) + (int)($plan_details->plan_price) * 100;

                $taxPercentage = isset($config[25]) ? (int) $config[25]->config_value : 0;
                $amountToBePaid = ($plan_details->plan_price * $taxPercentage / 100) + ($plan_details->plan_price * 100);
                
                $gobiz_transaction_id = uniqid();
                $paymentReference = Paystack::genTranxRef();

                $invoice_details = [];

                $invoice_details['from_billing_name'] = $userData->billing_name;
                $invoice_details['from_billing_address'] = $userData->billing_address;
                $invoice_details['from_billing_city'] = $userData->billing_city;
                $invoice_details['from_billing_state'] = $userData->billing_state;
                $invoice_details['from_billing_zipcode'] = $userData->billing_zipcode;
                $invoice_details['from_billing_country'] = $userData->billing_country;
                $invoice_details['from_vat_number'] = $userData->vat_number;
                $invoice_details['from_billing_phone'] = $userData->billing_phone;
                $invoice_details['from_billing_email'] = $userData->billing_email;

                $invoice_details['to_billing_name'] = $userData->billing_name;
                $invoice_details['to_billing_address'] = $userData->billing_address;
                $invoice_details['to_billing_city'] = $userData->billing_city;
                $invoice_details['to_billing_state'] = $userData->billing_state;
                $invoice_details['to_billing_zipcode'] = $userData->billing_zipcode;
                $invoice_details['to_billing_country'] = $userData->billing_country;
                $invoice_details['to_billing_phone'] = $userData->billing_phone;
                $invoice_details['to_billing_email'] = $userData->billing_email;
                $invoice_details['to_vat_number'] = $userData->vat_number;
                
                $invoice_details['tax_name'] = $userData->tax_name;
                $invoice_details['tax_type'] = $userData->tax_type;
                $invoice_details['tax_value'] = $userData->tax_value;

                $invoice_details['invoice_amount'] = $amountToBePaid;
                $invoice_details['subtotal'] = $plan_details->plan_price;
                // $invoice_details['tax_amount'] = (int)($plan_details->plan_price) * (int)($config[25]->config_value) / 100;
                $taxAmount = 0; // Default value if key 25 is not found

                if (isset($config[25])) {
                    $taxAmount = (int)($plan_details->plan_price) * (int)($config[25]->config_value) / 100;
                }

                $invoice_details['tax_amount'] = $taxAmount;
                
                //create transaction and save to database.
                $transaction = new Transaction();
                $transaction->gobiz_transaction_id = $gobiz_transaction_id;
                $transaction->transaction_date = now();
                $transaction->transaction_id = $paymentReference;
                $transaction->user_id = Auth::user()->id;
                $transaction->plan_id = $plan_details->plan_id;
                $transaction->description = $plan_details->plan_name . " Plan";
                $transaction->payment_gateway_name = "Paystack";
                $transaction->transaction_amount = $amountToBePaid / 100; // Convert back to Naira
                // $transaction->transaction_currency = $config[1]->config_value;
                $transactionCurrency = isset($config[1]) ? $config[1]->config_value : 'default_currency';
                $transaction->transaction_currency = $transactionCurrency;
                $transaction->invoice_details = json_encode($invoice_details);
                $transaction->payment_status = "PENDING";
                $transaction->save();

                // // dd("Amount to Pay", $amountToBePaid);
                // $paymentUrl = Paystack::getAuthorizationUrl()->with([
                //     'amount' => 700 * 100, //$amountToBePaid,
                //     'email' => $userData->billing_email,
                //     'reference' => $paymentReference,
                //     'callback_url' => route('paystack.callback'),
                // ]);

                // // dd("Transactions", $transaction, $paymentUrl);

                // return redirect()->to($paymentUrl);
                
                $data = array(
                    "amount" => $amountToBePaid,
                    "reference" => $paymentReference,
                    "email" => $userData->billing_email,
                    "currency" => "NGN"                
                );
            
                return Paystack::getAuthorizationUrl($data)->redirectNow();
            }
        } else {
            return redirect()->route('login');
        }
    }
    public function handleCallback(Request $request)
    {
        $paymentReference = $request->query('reference');

        if (!$paymentReference) {
            return view('errors.404');
        } else {
            $config = DB::table('config')->get();
            $transaction = Transaction::where('transaction_id', $paymentReference)->where('status', 1)->first();

            $paymentDetails = Paystack::getPaymentData();

            if ($paymentDetails['status'] === 'success') {
                $transaction->payment_status = 'SUCCESS';
                $transaction->save();

                $user = User::find(Auth::user()->id);
                $planData = Plan::where('plan_id', $transaction->plan_id)->first();
                $termDays = $planData->validity;

                // Update user plan and validity
                if ($user->plan_validity === null) {
                    $planValidity = Carbon::now();
                    $planValidity->addDays($termDays);

                    $invoiceCount = Transaction::where("invoice_prefix", $config[16]->config_value)->count();
                    $invoiceCount = $invoiceCount + 1;
                    $invoiceNumber = $config[16]->config_value . str_pad($invoiceCount, 4, '0', STR_PAD_LEFT);

                    $user->plan_id = $transaction->plan_id;
                    $user->plan_validity = $planValidity;
                    $user->invoice_number = $invoiceNumber;
                    $user->save();

                    // Generate and send invoice
                    $invoiceData = [
                        'invoice_number' => $invoiceNumber,
                        'transaction_id' => $transaction->transaction_id,
                        'transaction_date' => $transaction->transaction_date,
                        'user' => $user,
                        'plan' => $planData,
                        'term_days' => $termDays,
                    ];

                    Mail::to($user->email)->send(new InvoiceMail($invoiceData));
                }

                // Redirect user to success page
                return redirect()->route('payment.success');
            } else {
                // Payment was not successful
                $transaction->payment_status = 'FAILED';
                $transaction->save();

                // Redirect user to payment failed page
                return redirect()->route('payment.failed');
            }
        }
    }
}
