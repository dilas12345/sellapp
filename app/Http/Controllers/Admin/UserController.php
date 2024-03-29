<?php

namespace App\Http\Controllers\Admin;

use App\Plan;
use App\User;
use App\Gallery;
use App\Payment;
use App\Service;
use App\Setting;
use Carbon\Carbon;
use App\Transaction;
use App\BusinessCard;
use App\BusinessHour;
use App\StoreProduct;
use App\BusinessField;
use Illuminate\Http\Request;
use Laravel\Ui\Presets\React;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    // All Users
    public function users()
    {
        $users = User::where('role_id', '2')->orderBy('created_at', 'desc')->get();
        $settings = Setting::where('status', 1)->first();
        $config = DB::table('config')->get();

        return view('admin.users.users', compact('users', 'settings', 'config'));
    }

    // View User
    public function viewUser(Request $request, $id)
    {
        $user_details = User::where('user_id', $id)->first();
        if ($user_details == null) {
            return view('errors.404');
        } else {
            $user_cards = BusinessCard::where('user_id', $user_details->user_id)->where('status', 1)->get();
            $settings = Setting::where('status', 1)->first();
            return view('admin.users.view-user', compact('user_details', 'user_cards', 'settings'));
        }
    }

    // Edit User
    public function editUser(Request $request, $id)
    {
        $user_details = User::where('user_id', $id)->first();
        $settings = Setting::where('status', 1)->first();
        if ($user_details == null) {
            return view('errors.404');
        } else {
            return view('admin.users.edit-user', compact('user_details', 'settings'));
        }
    }

    // Update User
    public function updateUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'full_name' => 'required',
            'email' => 'required'
        ]);

        if ($request->password == null) {
            User::where('user_id', $request->user_id)->update([
                'name' => $request->full_name,
                'email' => $request->email
            ]);
        } else {
            User::where('user_id', $request->user_id)->update([
                'name' => $request->full_name,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);
        }
        return redirect()->route('admin.users')->with('success', 'User Updated Successfully!');
    }

    // Change user plan
    public function ChangeUserPlan(Request $request, $id)
    {
        $user_details = User::where('user_id', $id)->first();
        $plans = Plan::where('status', 1)->get();
        $settings = Setting::where('status', 1)->first();
        $config = DB::table('config')->get();
        if ($plans == null) {
            return view('errors.404');
        } else {
            return view('admin.users.change-plan', compact('user_details', 'plans', 'settings', 'config'));
        }
    }

    // Upgrade user plan
    public function UpdateUserPlan(Request $request)
    {

        $config = DB::table('config')->get();

        $user_details = User::where('user_id', $request->user_id)->first();

        $plan_data = Plan::where('plan_id', $request->plan_id)->first();
        $term_days = $plan_data->validity;

        // $amountToBePaid = ((int)($plan_data->plan_price) * (int)($config[25]->config_value) / 100) + (int)($plan_data->plan_price);
        $amountToBePaid = "";
        if (isset($config[25])) {
            $amountToBePaid = ((int)($plan_data->plan_price) * (int)($config[25]->config_value) / 100) + (int)($plan_data->plan_price);
        } else {
            // Handle the case when the key does not exist
            // You can set a default value or display an error message
        }

        if ($user_details->plan_validity == "") {

            $plan_validity = Carbon::now();
            $plan_validity->addDays($term_days);

            $invoice_count = Transaction::where("invoice_prefix", $config[15]->config_value)->count();
            $invoice_number = $invoice_count + 1;

            $gobiz_transaction_id = uniqid();

            $invoice_details = [];

            $invoice_details['from_billing_name'] = $request->billing_name;
            $invoice_details['from_billing_address'] = $request->billing_address;
            $invoice_details['from_billing_city'] = $request->billing_city;
            $invoice_details['from_billing_state'] = $request->billing_state;
            $invoice_details['from_billing_zipcode'] = $request->billing_zipcode;
            $invoice_details['from_billing_country'] = $request->billing_country;
            $invoice_details['from_vat_number'] = $request->vat_number;
            $invoice_details['from_billing_phone'] = $request->billing_phone;
            $invoice_details['from_billing_email'] = $request->billing_email;

            $invoice_details['to_billing_name'] = $user_details->billing_name;
            $invoice_details['to_billing_address'] = $user_details->billing_address;
            $invoice_details['to_billing_city'] = $user_details->billing_city;
            $invoice_details['to_billing_state'] = $user_details->billing_state;
            $invoice_details['to_billing_zipcode'] = $user_details->billing_zipcode;
            $invoice_details['to_billing_country'] = $user_details->billing_country;
            $invoice_details['to_billing_phone'] = $user_details->billing_phone;
            $invoice_details['to_billing_email'] = $user_details->billing_email;
            $invoice_details['to_vat_number'] = $user_details->vat_number;

            $invoice_details['tax_name'] = $request->tax_name;
            $invoice_details['tax_type'] = $request->tax_type;
            $invoice_details['tax_value'] = $request->tax_value;

            $invoice_details['invoice_amount'] = $amountToBePaid;
            $invoice_details['subtotal'] = $plan_data->plan_price;
            $invoice_details['tax_amount'] = (int)($plan_data->plan_price) * (int)($config[25]->config_value) / 100;

            // If order is created from stripe
            $transaction = new Transaction();
            $transaction->gobiz_transaction_id = $gobiz_transaction_id;
            $transaction->transaction_date = now();
            $transaction->transaction_id = "";
            $transaction->user_id = $user_details->id;
            $transaction->plan_id = $plan_data->plan_id;
            $transaction->description = $plan_data->plan_name . " Plan";
            $transaction->payment_gateway_name = "Offline";
            $transaction->transaction_amount = $amountToBePaid;
            $transaction->invoice_prefix = $config[15]->config_value;
            $transaction->invoice_number = $invoice_number;
            $transaction->transaction_currency = $config[1]->config_value;
            $transaction->invoice_details = json_encode($invoice_details);
            $transaction->payment_status = "SUCCESS";
            $transaction->save();

            User::where('id', $user_details->id)->update([
                'plan_id' => $request->plan_id,
                'term' => $term_days,
                'plan_validity' => $plan_validity,
                'plan_activation_date' => now(),
                'plan_details' => $plan_data
            ]);

            $details = [
                'from_billing_name' => $config[16]->config_value,
                'from_billing_email' => $config[17]->config_value,
                'from_billing_address' => $config[19]->config_value,
                'from_billing_city' => $config[20]->config_value,
                'from_billing_state' => $config[21]->config_value,
                'from_billing_country' => $config[23]->config_value,
                'from_billing_zipcode' => $config[22]->config_value,
                'gobiz_transaction_id' => $gobiz_transaction_id,
                'to_billing_name' => $user_details->billing_name,
                'invoice_currency' => $config[1]->config_value,
                'invoice_amount' => $plan_data->plan_price,
                'invoice_id' => $config[15]->config_value . $invoice_number,
                'invoice_date' => Carbon::now(),
                'description' => $plan_data->plan_name . ' plan Upgrade',
                'email_heading' => $config[27]->config_value,
                'email_footer' => $config[28]->config_value,
            ];

            try {
                Mail::to($user_details->email)->send(new \App\Mail\SendEmailInvoice($details));
            } catch (\Exception $e) {
            }

            alert()->success(trans('Plan changed success!'));
            return redirect()->route('admin.offline.transactions');
        } else {
            $message = "";
            if ($user_details->plan_id == $request->plan_id) {


                // Check if plan validity is expired or not.
                $plan_validity = \Carbon\Carbon::createFromFormat('Y-m-d H:s:i', $user_details->plan_validity);
                $current_date = Carbon::now();
                $remaining_days = $current_date->diffInDays($plan_validity, false);

                if ($remaining_days > 0) {
                    $plan_validity = Carbon::parse($user_details->plan_validity);
                    $plan_validity->addDays($term_days);
                    $message = "Plan changed successfully!";
                } else {
                    $plan_validity = Carbon::now();
                    $plan_validity->addDays($term_days);
                    $message = "Plan changed successfully!";
                }
            } else {

                // Making all cards inactive, For Plan change
                BusinessCard::where('user_id', $user_details->user_id)->update([
                    'card_status' => 'inactive',
                ]);

                $plan_validity = Carbon::now();
                $plan_validity->addDays($term_days);
                $message = "Plan changed successfully!";
            }

            // $invoice_count = Transaction::where("invoice_prefix", $config[15]->config_value)->count();
            $invoice_count = '';
            if (isset($config[15])) {
                $invoice_count = Transaction::where("invoice_prefix", $config[15]->config_value)->count();
            } else {
                // Handle the case when the key does not exist
                // You can set a default value or display an error message
            }

            //remember to fall back to the one below!!
            // $invoice_prefix = $config->where('config_key', 'invoice_prefix')->first()->config_value;
            // $invoice_count = Transaction::where('invoice_prefix', $invoice_prefix)->count();

            // $invoice_number = $invoice_count + 1;
            $invoice_number = intval($invoice_count) + 1;


            $gobiz_transaction_id = uniqid();

            $invoice_details = [];

            $invoice_details['from_billing_name'] = $request->billing_name;
            $invoice_details['from_billing_address'] = $request->billing_address;
            $invoice_details['from_billing_city'] = $request->billing_city;
            $invoice_details['from_billing_state'] = $request->billing_state;
            $invoice_details['from_billing_zipcode'] = $request->billing_zipcode;
            $invoice_details['from_billing_country'] = $request->billing_country;
            $invoice_details['from_vat_number'] = $request->vat_number;
            $invoice_details['from_billing_phone'] = $request->billing_phone;
            $invoice_details['from_billing_email'] = $request->billing_email;

            $invoice_details['to_billing_name'] = $user_details->billing_name;
            $invoice_details['to_billing_address'] = $user_details->billing_address;
            $invoice_details['to_billing_city'] = $user_details->billing_city;
            $invoice_details['to_billing_state'] = $user_details->billing_state;
            $invoice_details['to_billing_zipcode'] = $user_details->billing_zipcode;
            $invoice_details['to_billing_country'] = $user_details->billing_country;
            $invoice_details['to_billing_phone'] = $user_details->billing_phone;
            $invoice_details['to_billing_email'] = $user_details->billing_email;
            $invoice_details['to_vat_number'] = $user_details->vat_number;
            $invoice_details['tax_name'] = $request->tax_name;
            $invoice_details['tax_type'] = $request->tax_type;
            $invoice_details['tax_value'] = $request->tax_value;

            $invoice_details['invoice_amount'] = $amountToBePaid;
            $invoice_details['subtotal'] = $plan_data->plan_price;
            // $invoice_details['tax_amount'] = (int)($plan_data->plan_price) * (int)($config[25]->config_value) / 100;
            $invoice_details['tax_amount'] = 0; // Set a default value or handle the case when the key is undefined

            if (isset($config[25])) {
                $invoice_details['tax_amount'] = (int)($plan_data->plan_price) * (int)($config[25]->config_value) / 100;
            } else {
                // Handle the case when the key does not exist
                // You can set a default value or display an error message
            }

            // If order is created from stripe
            $transaction = new Transaction();
            $transaction->gobiz_transaction_id = $gobiz_transaction_id;
            $transaction->transaction_date = now();
            $transaction->transaction_id = "";
            $transaction->user_id = $user_details->id;
            $transaction->plan_id = $plan_data->plan_id;
            $transaction->description = $plan_data->plan_name . " Plan";
            $transaction->payment_gateway_name = "Offline";
            $transaction->transaction_amount = $amountToBePaid;
            // $transaction->invoice_prefix = $config[15]->config_value;
            $transaction->invoice_prefix = ''; // Set a default value or handle the case when the key is undefined

            if (isset($config[15])) {
                $transaction->invoice_prefix = $config[15]->config_value;
            } else {
                // Handle the case when the key does not exist
                // You can set a default value or display an error message
            }
            
            $transaction->invoice_number = $invoice_number;
            // $transaction->transaction_currency = $config[1]->config_value;
            $transaction_currency = $config->where('config_key', 'transaction_currency')->first();

            if ($transaction_currency) {
                $transaction->transaction_currency = $transaction_currency->config_value;
            } else {
                // Handle the case when the configuration value is missing or null
                // You can assign a default value or take appropriate action
                $transaction->transaction_currency = 'default_currency';
            };
            
            $transaction->invoice_details = json_encode($invoice_details);
            $transaction->payment_status = "SUCCESS";
            $transaction->save();

            User::where('id', $user_details->id)->update([
                'plan_id' => $request->plan_id,
                'term' => $term_days,
                'plan_validity' => $plan_validity,
                'plan_activation_date' => now(),
                'plan_details' => $plan_data
            ]);

            // dd($user_details);
            $email_heading = ''; // Set a default value or handle the case when the key is undefined

            if (isset($config[27])) {
                $email_heading = $config[27]->config_value;
            } else {
                // Handle the case when the key does not exist
                // You can set a default value or display an error message
            }

            $email_footer = ''; // Set a default value or handle the case when the key is undefined

            if (isset($config[28])) {
                $email_footer = $config[28]->config_value;
            } else {
                // Handle the case when the key does not exist
                // You can set a default value or display an error message
            }
            $details = [
                'from_billing_name' => $user_details->billing_name,
                'from_billing_email' => $user_details->billing_email,
                'from_billing_address' => $user_details->billing_address,
                'from_billing_city' => $user_details->billing_city,
                'from_billing_state' => $user_details->billing_state,
                'from_billing_country' => $user_details->billing_country,
                'from_billing_zipcode' => $user_details->billing_zipcode,

                'gobiz_transaction_id' => $gobiz_transaction_id,
                'to_billing_name' => $user_details->billing_name,
                'invoice_currency' => $config[1]->config_value ?? 'NGN',
                'invoice_amount' => $plan_data->plan_price,
                'invoice_id' => $user_details['id'] . $invoice_number,
                'invoice_date' => Carbon::now(),
                'description' => $plan_data->plan_name . ' plan Upgrade',
                'email_heading' => $email_heading,
                
                'email_footer' => $email_footer,
            ];

            try {
                Mail::to($user_details->email)->send(new \App\Mail\SendEmailInvoice($details));
            } catch (\Exception $e) {
            }

            alert()->success($message);
            return redirect()->route('admin.change.user.plan', $request->user_id);
        }
    }

    // Update status
    public function updateStatus(Request $request)
    {
        $user_details = User::where('user_id', $request->query('id'))->first();
        if ($user_details->status == 0) {
            $status = 1;
        } else {
            $status = 0;
        }
        User::where('user_id', $request->query('id'))->update(['status' => $status]);
        return redirect()->route('admin.users')->with('success', 'User Status Updated Successfully!');
    }

    // Delete User
    public function deleteUser(Request $request)
    {
        $allcards = BusinessCard::where('user_id', $request->query('id'))->get();
        $user = User::where('user_id', $request->query('id'))->first();
        for ($i = 0; $i < count($allcards); $i++) {
            BusinessField::where('card_id', $allcards[$i]->card_id)->delete();
            BusinessHour::where('card_id', $allcards[$i]->card_id)->delete();
            Gallery::where('card_id', $allcards[$i]->card_id)->delete();
            Payment::where('card_id', $allcards[$i]->card_id)->delete();
            Service::where('card_id', $allcards[$i]->card_id)->delete();
            StoreProduct::where('card_id', $allcards[$i]->card_id)->delete();
        }

	$transactions = Transaction::where('user_id', $request->query('id'))->first();
        $businessCards = BusinessCard::where('user_id', $request->query('id'))->first();
        
        if ($transactions != null) {
            $transactions->delete();
        }
        
        if ($businessCards != null) {
            $businessCards->delete();
        }

        User::where('user_id', $request->query('id'))->delete();
        return redirect()->route('admin.users')->with('success', 'User deleted Successfully!');
    }

    // Login As User
    public function authAs(Request $request, $id)
    {
        $user_details = User::where('user_id', $id)->where('status', 1)->first();
        if (isset($user_details)) {
            Auth::loginUsingId($user_details->id);
            return redirect()->route('user.dashboard');
        } else {
            return redirect()->route('admin.users')->with('info', 'User account was not found!');
        }
    }
}
