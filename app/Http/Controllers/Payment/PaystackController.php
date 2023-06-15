<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Paystack;
use Illuminate\Support\Carbon;
use App\BusinessCard;
use URL;
use App\Plan;
use App\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use App\Transaction as TransactionModel;

class PaystackController extends Controller
{

    /**
     * Redirect the User to Paystack Payment Page
     * @return Url
     */
    public function redirectToGateway()
    {
        try{
            return Paystack::getAuthorizationUrl()->redirectNow();
        }catch(\Exception $e) {
            return Redirect::back()->withMessage(['msg'=>'The paystack token has expired. Please refresh the page and try again.', 'type'=>'error']);
        }        
    }

    /**
     * Obtain Paystack payment information
     * @return void
     */
    public function handleGatewayCallback()
    {
        $paymentDetails = Paystack::getPaymentData();

        dd($paymentDetails);
        // Now you have the payment details,
        // you can store the authorization_code in your db to allow for recurrent subscriptions
        // you can then redirect or do whatever you want
    }

    public function payWithpaystack(Request $request, $planId)
    {
        if(Auth::user()) {
        $plan_details = Plan::where('plan_id', $planId)->where('status', 1)->first();
        $config = DB::table('config')->get();
        $userData = User::where('id', Auth::user()->id)->first();

        if ($plan_details == null) {
            return view('errors.404');
        } else {

            // $amountToBePaid = ((int)($plan_details->plan_price) * (int)($config[25]->config_value) / 100) + (int)($plan_details->plan_price);
            $tax_rate = 0; // Replace with the appropriate tax rate value or reference

            if (isset($config[25])) {
                $tax_rate = (int) $config[25]->config_value;
            }

            $amountToBePaid = ((int)($plan_details->plan_price) * $tax_rate / 100) + (int)($plan_details->plan_price);

            $payer = new Payer();
            $payer->setPaymentMethod('paystack');

            $item_1 = new Item();
            $item_1->setName($plan_details->plan_name . " Plan")
                /** item name **/
                ->setCurrency($config[1]->config_value)
                ->setQuantity(1)
                ->setPrice($amountToBePaid);
            /** unit price **/

            $item_list = new ItemList();
            $item_list->setItems(array($item_1));

            $amount = new Amount();
            $amount->setCurrency($config[1]->config_value)
                ->setTotal($amountToBePaid);
            $redirect_urls = new RedirectUrls();
            /** Specify return URL **/
            $redirect_urls->setReturnUrl(URL::route('paypalPaymentStatus'))
                ->setCancelUrl(URL::route('paypalPaymentStatus'));

            $transaction = new Transaction();
            $transaction->setAmount($amount)
                ->setItemList($item_list)
                ->setDescription($plan_details->plan_name . " Plan");

            $payment = new Payment();
            $payment->setIntent('Sale')
                ->setPayer($payer)
                ->setRedirectUrls($redirect_urls)
                ->setTransactions(array($transaction));
            try {
                $payment->create($this->_api_context);
            } catch (\PayPal\Exception\PPConnectionException $ex) {
                if (\Config::get('app.debug')) {
                    \Session::put('error', 'Connection timeout');
                    alert()->error(trans("Payment failed, Something went wrong!"));
                    return redirect()->route('user.plans');
                } else {
                    \Session::put('error', 'Some error occur, sorry for inconvenient');
                    alert()->error(trans("Payment failed, Something went wrong!"));
                    return redirect()->route('user.plans');
                }
            }
            foreach ($payment->getLinks() as $link) {
                if ($link->getRel() == 'approval_url') {
                    $redirect_url = $link->getHref();
                    break;
                }
            }

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
            $taxPercentage = 0; // Replace with the appropriate tax percentage value or reference

            $invoice_details['tax_amount'] = (int)($plan_details->plan_price) * (int)($taxPercentage) / 100;

            // Store into Database before starting PayPal redirect
            $transaction = new TransactionModel();
            $transaction->gobiz_transaction_id = uniqid();
            $transaction->transaction_date = now();
            $transaction->transaction_id = $payment->getId();
            $transaction->user_id = Auth::user()->id;
            $transaction->plan_id = $plan_details->plan_id;
            $transaction->desciption = $plan_details->plan_name . " Plan";
            $transaction->payment_gateway_name = "PayPal";
            $transaction->transaction_amount = $amountToBePaid;
            // $transaction->transaction_currency = $config[1]->config_value;
            $transaction_currency = 'NGN'; // Replace with the appropriate transaction currency value or reference
            $transaction->transaction_currency = $transaction_currency;

            $transaction->invoice_details = json_encode($invoice_details);
            $transaction->payment_status = "PENDING";
            $transaction->save();

            /** add payment ID to session **/
            \Session::put('paypal_payment_id', $payment->getId());
            if (isset($redirect_url)) {
                /** redirect to paypal **/
                return Redirect::away($redirect_url);
            }

            \Session::put('error', 'Unknown error occurred');
            alert()->error(trans("Payment failed, Something went wrong!"));
            return redirect()->route('user.plans');
        }
        } else {
            return redirect()->route('login');
        }
    }
}