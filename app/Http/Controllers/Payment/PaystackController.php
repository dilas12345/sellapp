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
use Illuminate\Support\Facades\URL;
use App\BusinessCard;
use Carbon\Carbon;

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
                
                $callbackUrl = URL::route('paystack.callback', ['planId' => $planId]);

                // dd($callbackUrl);

                $data = array(
                    "amount" => $amountToBePaid,
                    "reference" => $paymentReference,
                    "email" => $userData->billing_email,
                    "currency" => "NGN",
                    "callback_url" => $callbackUrl                
                );

                // dd("Data", $data);
            
                return Paystack::getAuthorizationUrl($data)->redirectNow('user.plans');
            }
        } else {
            return redirect()->route('login');
        }
    }
    public function handleCallback(Request $request)
    {

        // dd("Helloworld");

        $paymentReference = $request->query('reference');

        if (!$paymentReference) {
            return view('errors.404');
        } else {
            $orderId = $paymentReference;
            $config = DB::table('config')->get();
            $transaction = Transaction::where('transaction_id', $paymentReference)->where('status', 1)->first();

            $paymentDetails = Paystack::getPaymentData();

            // dd($paymentDetails);

            if ($paymentDetails['status'] === true) {
                $transaction->payment_status = 'SUCCESS';
                $transaction->save();

                $user = User::find(Auth::user()->id);
                $planData = Plan::where('plan_id', $transaction->plan_id)->first();
                $termDays = $planData->validity;

                // Update user plan and validity
                if ($user->plan_validity === null) {
                    $planValidity = Carbon::now();
                    $planValidity->addDays($termDays);

                    $transaction = Transaction::where('transaction_id', $plan_data)->where('status', 1)->first();

                    $invoiceCount = Transaction::where("invoice_prefix", $config[16]->config_value)->count();
                    $invoiceCount = $invoiceCount + 1;
                    $invoiceNumber = $config[16]->config_value . str_pad($invoiceCount, 4, '0', STR_PAD_LEFT);

                    $user->plan_id = $transaction->plan_id;
                    $user->plan_validity = $planValidity;
                    $user->invoice_number = $invoiceNumber;
                    $user->save();

                    User::where('user_id', Auth::user()->user_id)->update([
                        'plan_id' => $transaction->plan_id,
                        'term' => $termDays,
                        'plan_validity' => $planValidity,
                        'plan_activation_date' => now(),
                        'plan_details' => $planData
                    ]);


                    // $invoice_count = Transaction::where("invoice_prefix", $config[15]->config_value)->count();
                    $index = 15; // The desired index in the $config array

                    if (isset($config[$index])) {
                        $invoice_prefix = $config[$index]->config_value;
                        $invoice_count = Transaction::where("invoice_prefix", $invoice_prefix)->count();
                    } else {
                        // Handle the case when $config[15] is undefined
                        // This could be an error message or alternative logic
                        $invoice_count = 0; // Set a default value, or handle it as per your requirement
                    }
                    $invoice_number = $invoice_count + 1;

                    // Generate and send invoice
                    $invoiceData = [
                        'invoice_number' => $invoiceNumber,
                        'transaction_id' => $transaction->transaction_id,
                        'transaction_date' => $transaction->transaction_date,
                        'invoice_number' => $invoice_number,
                        'user' => $user,
                        'plan' => $planData,
                        'term_days' => $termDays,
                        'payment_status' => 'SUCCESS',
                    ];

                    Mail::to($user->email)->send(new InvoiceMail($invoiceData));

                    alert()->success('Plan activated Successfully!');
                    return redirect()->route('user.plans');
                } else {
                    $message = "";

                    if ($user->plan_id == $transaction->plan_id) {

                        // Check if plan validity is expired or not.
                        $plan_validity = \Carbon\Carbon::createFromFormat('Y-m-d H:s:i', $user->plan_validity);
                        $current_date = Carbon::now();
                        $remaining_days = $current_date->diffInDays($plan_validity, false);

                        if ($remaining_days > 0) {
                            $plan_validity = Carbon::parse($user->plan_validity);
                            $plan_validity->addDays($termDays);
                            $message = "Plan renewed successfully!";
                        } else {
                            $plan_validity = Carbon::now();
                            $plan_validity->addDays($termDays);
                            $message = "Plan renewed successfully!";
                        }

			            // Making all cards inactive, For Plan change
                        BusinessCard::where('user_id', Auth::user()->user_id)->update([
                            'card_status' => 'inactive',
                        ]);
                    } else {

                        // Making all cards inactive, For Plan change
                        BusinessCard::where('user_id', Auth::user()->user_id)->update([
                            'card_status' => 'inactive',
                        ]);

                        $plan_validity = Carbon::now();
                        $plan_validity->addDays($termDays);
                        $message = "Plan activated successfully!";
                    }

                    // $invoice_count = Transaction::where("invoice_prefix", $config[15]->config_value)->count();
                    $index = 15; // The desired index in the $config array

                    if (isset($config[$index])) {
                        $invoice_prefix = $config[$index]->config_value;
                        $invoice_count = Transaction::where("invoice_prefix", $invoice_prefix)->count();
                    } else {
                        // Handle the case when $config[15] is undefined
                        // This could be an error message or alternative logic
                        $invoice_count = 0; // Set a default value, or handle it as per your requirement
                    }
                    $invoice_number = $invoice_count + 1;

                    Transaction::where('transaction_id', $orderId)->update([
                        'transaction_id' => $paymentReference,
                        // 'invoice_prefix' => $config[15]->config_value,
                        'invoice_number' => $invoice_number,
                        'payment_status' => 'SUCCESS',
                    ]);

                    User::where('user_id', Auth::user()->user_id)->update([
                        'plan_id' => $transaction->plan_id,
                        'term' => $termDays,
                        'plan_validity' => $plan_validity,
                        'plan_activation_date' => now(),
                        'plan_details' => $planData
                    ]);

                    $encode = json_decode($transaction['invoice_details'], true);
                    // dd("Hello Che", $encode);
                    
                    // $details = [
                    //     'from_billing_name' => $encode['from_billing_name'],
                    //     'from_billing_email' => $encode['from_billing_email'],
                    //     'from_billing_address' => $encode['from_billing_address'],
                    //     'from_billing_city' => $encode['from_billing_city'],
                    //     'from_billing_state' => $encode['from_billing_state'],
                    //     'from_billing_country' => $encode['from_billing_country'],
                    //     'from_billing_zipcode' => $encode['from_billing_zipcode'],
                    //     'gobiz_transaction_id' => $transaction->gobiz_transaction_id,
                    //     'to_billing_name' => $encode['to_billing_name'],
                    //     'invoice_currency' => $transaction->transaction_currency,
                    //     'subtotal' => $encode['subtotal'],
			        //     'tax_amount' => $encode['tax_amount'],
                    //     'invoice_amount' => $encode['invoice_amount'],
                    //     // 'invoice_id' => $config[15]->config_value . $invoice_number,
                    //     'invoice_id' => $encode['invoice_id'],
                    //     'invoice_date' => $transaction->created_at,
                    //     'description' => $transaction->description,
                    //     'email_heading' => '',
                    //     'email_footer' => '',
                    // ];

                    // try {
                    //     Mail::to($encode['to_billing_email'])->send(new \App\Mail\SendEmailInvoice($details));
                    // } catch (\Exception $e) {

                    // }

                    alert()->success($message);
                    return redirect()->route('user.plans');
                }

                // Redirect user to success page
                // return redirect()->route('payment.success');
                    // alert()->success('Plan activated Successfully!');
                    // return redirect()->route('user.plans');
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
