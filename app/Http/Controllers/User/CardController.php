<?php

namespace App\Http\Controllers\User;

use App\Plan;
use App\User;
use App\Theme;
use App\Medias;
use App\Gallery;
use App\Gateway;
use App\Payment;
use App\Service;
use App\Setting;
use App\Currency;
use Carbon\Carbon;
use App\Transaction;
use App\BusinessCard;
use App\Portfolio;
use App\BusinessHour;
use App\StoreProduct;
use App\BusinessField;
use Illuminate\Http\Request;
use Jorenvh\Share\ShareFacade;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\URL;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class CardController extends Controller
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

    // All user cards
    public function cards()
    {
        $active_plan = Plan::where('plan_id', Auth::user()->plan_id)->first();
        $plan = User::where('user_id', Auth::user()->user_id)->first();

        if ($active_plan != null) {
            $business_cards = DB::table('business_cards')
                ->join('users', 'business_cards.user_id', '=', 'users.user_id')
                ->select('users.user_id', 'users.plan_validity', 'business_cards.*')
                ->where('business_cards.user_id', Auth::user()->user_id)->where('business_cards.status', 1)->orderBy('business_cards.id', 'desc')->get();
            $settings = Setting::where('status', 1)->first();

            return view('user.cards.cards', compact('business_cards', 'settings'));
        } else {
            return redirect()->route('user.plans');
        }
    }

    public function plans()
    {
        $plans = DB::table('plans')->where('status', 1)->get();
        $config = DB::table('config')->get();
        $free_plan = Transaction::where('user_id', Auth::user()->id)->where('transaction_amount', '0')->count();
        $plan = User::where('user_id', Auth::user()->user_id)->first();
        $active_plan = json_decode($plan->plan_details);
        $settings = Setting::where('status', 1)->first();
        // $currency = Currency::where('iso_code', $config[1]->config_value)->first();
        // $currency = array('aed'=>'AED','afn'=>'&#1547;','all'=>'&#76;&#101;&#107;','amd'=>'AMD','ang'=>'&#402;','aoa'=>'AOA','ars'=>'&#36;','aud'=>'&#36;','awg'=>'&#402;','azn'=>'&#1084;&#1072;&#1085;','bam'=>'&#75;&#77;','bbd'=>'&#36;','bdt'=>'BDT','bgn'=>'&#1083;&#1074;','bhd'=>'BHD','bif'=>'BIF','bmd'=>'&#36;','bnd'=>'&#36;','bob'=>'&#36;&#98;','brl'=>'&#82;&#36;','bsd'=>'&#36;','btn'=>'BTN','bwp'=>'&#80;','byr'=>'&#112;&#46;','bzd'=>'&#66;&#90;&#36;','cad'=>'&#36;','cdf'=>'CDF','chf'=>'&#67;&#72;&#70;','clp'=>'&#36;','cny'=>'&#165;','cop'=>'&#36;','crc'=>'&#8353;','cuc'=>'CUC','cup'=>'&#8369;','cve'=>'CVE','czk'=>'&#75;&#269;','djf'=>'DJF','dkk'=>'&#107;&#114;','dop'=>'&#82;&#68;&#36;','dzd'=>'DZD','egp'=>'&#163;','ern'=>'ERN','etb'=>'ETB','eur'=>'&#8364;','fjd'=>'&#36;','fkp'=>'&#163;','gbp'=>'&#163;','gel'=>'GEL','ggp'=>'&#163;','ghs'=>'&#162;','gip'=>'&#163;','gmd'=>'GMD','gnf'=>'GNF','gtq'=>'&#81;','gyd'=>'&#36;','hkd'=>'&#36;','hnl'=>'&#76;','hrk'=>'&#107;&#110;','htg'=>'HTG','huf'=>'&#70;&#116;','idr'=>'&#82;&#112;','ils'=>'&#8362;','imp'=>'&#163;','inr'=>'&#8377;','iqd'=>'IQD','irr'=>'&#65020;','isk'=>'&#107;&#114;','jep'=>'&#163;','jmd'=>'&#74;&#36;','jod'=>'JOD','jpy'=>'&#165;','kes'=>'KES','kgs'=>'&#1083;&#1074;','khr'=>'&#6107;','kmf'=>'KMF','kpw'=>'&#8361;','krw'=>'&#8361;','kwd'=>'KWD','kyd'=>'&#36;','kzt'=>'&#1083;&#1074;','lak'=>'&#8365;','lbp'=>'&#163;','lkr'=>'&#8360;','lrd'=>'&#36;','lsl'=>'LSL','lyd'=>'LYD','mad'=>'MAD','mdl'=>'MDL','mga'=>'MGA','mkd'=>'&#1076;&#1077;&#1085;','mmk'=>'MMK','mnt'=>'&#8366;','mop'=>'MOP','mro'=>'MRO','mur'=>'&#8360;','mvr'=>'MVR','mwk'=>'MWK','mxn'=>'&#36;','myr'=>'&#82;&#77;','mzn'=>'&#77;&#84;','nad'=>'&#36;','ngn'=>'&#8358;','nio'=>'&#67;&#36;','nok'=>'&#107;&#114;','npr'=>'&#8360;','nzd'=>'&#36;','omr'=>'&#65020;','pab'=>'&#66;&#47;&#46;','pen'=>'&#83;&#47;&#46;','pgk'=>'PGK','php'=>'&#8369;','pkr'=>'&#8360;','pln'=>'&#122;&#322;','prb'=>'PRB','pyg'=>'&#71;&#115;','qar'=>'&#65020;','ron'=>'&#108;&#101;&#105;','rsd'=>'&#1044;&#1080;&#1085;&#46;','rub'=>'&#1088;&#1091;&#1073;','rwf'=>'RWF','sar'=>'&#65020;','sbd'=>'&#36;','scr'=>'&#8360;','sdg'=>'SDG','sek'=>'&#107;&#114;','sgd'=>'&#36;','shp'=>'&#163;','sll'=>'SLL','sos'=>'&#83;','srd'=>'&#36;','ssp'=>'SSP','std'=>'STD','syp'=>'&#163;','szl'=>'SZL','thb'=>'&#3647;','tjs'=>'TJS','tmt'=>'TMT','tnd'=>'TND','top'=>'TOP','try'=>'&#8378;','ttd'=>'&#84;&#84;&#36;','twd'=>'&#78;&#84;&#36;','tzs'=>'TZS','uah'=>'&#8372;','ugx'=>'UGX','usd'=>'&#36;','uyu'=>'&#36;&#85;','uzs'=>'&#1083;&#1074;','vef'=>'&#66;&#115;','vnd'=>'&#8363;','vuv'=>'VUV','wst'=>'WST','xaf'=>'XAF','xcd'=>'&#36;','xof'=>'XOF','xpf'=>'XPF','yer'=>'&#65020;','zar'=>'&#82;','zmw'=>'ZMW');
        $currency ='ngn';
        $remaining_days = 0;

        if (isset($active_plan)) {
            $plan_validity = \Carbon\Carbon::createFromFormat('Y-m-d H:s:i', Auth::user()->plan_validity);
            $current_date = Carbon::now();
            $remaining_days = $current_date->diffInDays($plan_validity, false);
        }

        return view('user.plans.plans', compact('plans', 'settings', 'currency', 'active_plan', 'remaining_days', 'config', 'free_plan'));
    }

    // View Card Preview
    public function viewPreview(Request $request, $id)
    {
        
        $card_details = DB::table('business_cards')->where('card_id', $id)->where('status', 1)->first();

        if (isset($card_details)) {
            if ($card_details->card_type == "store") {
                $enquiry_button = '#';

                $business_card_details = DB::table('business_cards')->where('business_cards.card_id', $card_details->card_id)
                    ->join('users', 'business_cards.user_id', '=', 'users.user_id')
                    ->select('business_cards.*', 'users.plan_details')
                    ->first();

                if ($business_card_details) {

                    $products = DB::table('store_products')->where('card_id', $card_details->card_id)->where('product_status', 'instock')->orderBy('id', 'desc')->get();

                    $settings = Setting::where('status', 1)->first();
                    $config = DB::table('config')->get();

                    $plan_details = json_decode($business_card_details->plan_details, true);
                    $store_details = json_decode($business_card_details->description, true);

                    if ($store_details['whatsapp_no'] != null) {
                        $enquiry_button = $store_details['whatsapp_no'];
                    }

                    $whatsapp_msg = $store_details['whatsapp_msg'];
                    $currency = $store_details['currency'];

                    $url = URL::to('/') . "/" . strtolower(preg_replace('/\s+/', '-', $card_details->card_url));
                    $business_name = $card_details->title;
                    $profile = URL::to('/') . "/" . $business_card_details->profile;

                    $shareContentConfig = $config->where('config_key', 'share_content')->first();

                    if ($shareContentConfig) {
                        $shareContent = $shareContentConfig->config_value;
                        $shareContent = str_replace("{ business_name }", $business_name, $shareContent);
                        $shareContent = str_replace("{ business_url }", $url, $shareContent);
                        $shareContent = str_replace("{ appName }", $config->first()->config_value, $shareContent);

                        // If branding enabled, then show app name.
                        if ($plan_details['hide_branding'] == "1") {
                            $shareContent = str_replace("{ appName }", $business_name, $shareContent);
                        } else {
                            $shareContent = str_replace("{ appName }", $config->first()->config_value, $shareContent);
                        }

                        $url = urlencode($url);
                        $shareContent = urlencode($shareContent);
                    } else {
                        // Handle the case when the share_content configuration is missing
                        // You can assign a default value or take appropriate action
                        $shareContent = 'default_share_content';
                    }

                    $appNameConfig = $config->where('config_key', 'app_name')->first();

                    if ($plan_details['hide_branding'] == "1") {
                        $shareContent = str_replace("{ appName }", $business_name, $shareContent);
                    } else {
                        $shareContent = str_replace("{ appName }", $appNameConfig->config_value ?? 'default_app_name', $shareContent);
                    }

                    $url = urlencode($url);
                    $shareContent = urlencode($shareContent);

                    Session::put('locale', $business_card_details->card_lang);
                    app()->setLocale(Session::get('locale'));
                    
                    $qr_url = "https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl=" . $url;

                    $shareComponent['facebook'] = "https://www.facebook.com/sharer/sharer.php?u=$url&quote=$shareContent";
                    $shareComponent['twitter'] = "https://twitter.com/intent/tweet?text=$shareContent";
                    $shareComponent['linkedin'] = "https://www.linkedin.com/shareArticle?mini=true&url=$url";
                    $shareComponent['telegram'] = "https://telegram.me/share/url?text=$shareContent&url=$url";
                    $shareComponent['whatsapp'] = "https://api.whatsapp.com/send/?phone&text=$shareContent";

                    if ($card_details->theme_id == "7ccc432a06hty") {
                        return view('vcard.modern-store-light', compact('card_details', 'plan_details', 'store_details', 'business_card_details', 'products', 'settings', 'shareComponent', 'shareContent', 'config', 'enquiry_button', 'whatsapp_msg', 'currency'));
                    } else if ($card_details->theme_id == "7ccc432a06hju") {
                        return view('vcard.modern-store-dark', compact('card_details', 'plan_details', 'store_details', 'business_card_details', 'products', 'settings', 'shareComponent', 'shareContent', 'config', 'enquiry_button', 'whatsapp_msg', 'currency'));
                    }
                } else {
                    alert()->error(trans('Sorry, Please fill basic business details.'));
                    return redirect()->route('user.edit.card', $id);
                }
            } else {
                $enquiry_button = null;
                $business_card_details = DB::table('business_cards')->where('business_cards.card_id', $card_details->card_id)
                    ->join('users', 'business_cards.user_id', '=', 'users.user_id')
                    ->select('business_cards.*', 'users.plan_details')
                    ->first();

                if ($business_card_details) {

                    $feature_details = DB::table('business_fields')->where('card_id', $card_details->card_id)->orderBy('id', 'asc')->get();
                    $service_details = DB::table('services')->where('card_id', $card_details->card_id)->orderBy('id', 'asc')->get();
                    $galleries_details = DB::table('galleries')->where('card_id', $card_details->card_id)->orderBy('id', 'asc')->get();
                    $payment_details = DB::table('payments')->where('card_id', $card_details->card_id)->get();
                    $business_hours = DB::table('business_hours')->where('card_id', $card_details->card_id)->first();
                    $make_enquiry = DB::table('business_fields')->where('card_id', $card_details->card_id)->where('type', 'wa')->first();

                    if ($make_enquiry != null) {
                        $enquiry_button = $make_enquiry->content;
                    }

                    $settings = Setting::where('status', 1)->first();
                    $config = DB::table('config')->get();

                    $plan_details = json_decode($business_card_details->plan_details, true);

                    $url = URL::to('/') . "/" . strtolower(preg_replace('/\s+/', '-', $card_details->card_url));
                    $business_name = $card_details->title;
                    $profile = URL::to('/') . "/" . $business_card_details->profile;

                    // $shareContent = $config[30]->config_value;
                    $shareContent = ''; // Initialize $shareContent with an empty string or appropriate default value

                    if (isset($config[30])) {
                        $shareContent = $config[30]->config_value;
                        // Rest of your code using $shareContent
                    } else {
                        // Handle the case when the key does not exist
                        // You can set a default value or display an error message
                    }
                    $shareContent = str_replace("{ business_name }", $business_name, $shareContent);
                    $shareContent = str_replace("{ business_url }", $url, $shareContent);
                    // $shareContent = str_replace("{ appName }", $config[0]->config_value, $shareContent);
                    if (isset($config[0])) {
                        $shareContent = str_replace("{ appName }", $business_name, $shareContent);
                    } else {
                        // Handle the case when the key does not exist
                        // You can set a default value or display an error message
                    }

                    // If branding enabled, then show app name.

                    if ($plan_details['hide_branding'] == "1") {
                        $shareContent = str_replace("{ appName }", $business_name, $shareContent);
                    } else {
                        $shareContent = str_replace("{ appName }", $business_name, $shareContent);
                    }

                    $url = urlencode($url);
                    $shareContent = urlencode($shareContent);

                    Session::put('locale', $business_card_details->card_lang);
                    app()->setLocale(Session::get('locale'));

                    $qr_url = "https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl=" . $url;

                    $shareComponent['facebook'] = "https://www.facebook.com/sharer/sharer.php?u=$url&quote=$shareContent";
                    $shareComponent['twitter'] = "https://twitter.com/intent/tweet?text=$shareContent";
                    $shareComponent['linkedin'] = "https://www.linkedin.com/shareArticle?mini=true&url=$url";
                    $shareComponent['telegram'] = "https://telegram.me/share/url?text=$shareContent&url=$url";
                    $shareComponent['whatsapp'] = "https://api.whatsapp.com/send/?phone&text=$shareContent";

                    dd($card_details);
                    if ($card_details->theme_id == "7ccc432a06caa") {
                        return view('vcard.modern-vcard-light', compact('card_details', 'plan_details', 'business_card_details', 'feature_details', 'service_details', 'galleries_details', 'payment_details', 'business_hours', 'settings', 'shareComponent', 'shareContent', 'config', 'enquiry_button'));
                    } else if ($card_details->theme_id == "7ccc432a06vta") {
                        return view('vcard.modern-vcard-dark', compact('card_details', 'plan_details', 'business_card_details', 'feature_details', 'service_details', 'galleries_details', 'payment_details', 'business_hours', 'settings', 'shareComponent', 'shareContent', 'config', 'enquiry_button'));
                    } else if ($card_details->theme_id == "7ccc432a06cth") {
                        return view('vcard.classic-vcard-light', compact('card_details', 'plan_details', 'business_card_details', 'feature_details', 'service_details', 'galleries_details', 'payment_details', 'business_hours', 'settings', 'shareComponent', 'shareContent', 'config', 'enquiry_button'));
                    } else if ($card_details->theme_id == "7ccc432a06vyw") {
                        return view('vcard.classic-vcard-dark', compact('card_details', 'plan_details', 'business_card_details', 'feature_details', 'service_details', 'galleries_details', 'payment_details', 'business_hours', 'settings', 'shareComponent', 'shareContent', 'config', 'enquiry_button'));
                    } else if ($card_details->theme_id == "7ccc432a06ctw") {
                        return view('vcard.metro-vcard-light', compact('card_details', 'plan_details', 'business_card_details', 'feature_details', 'service_details', 'galleries_details', 'payment_details', 'business_hours', 'settings', 'shareComponent', 'shareContent', 'config', 'enquiry_button'));
                    } else if ($card_details->theme_id == "7ccc432a06vhd") {
                        return view('vcard.metro-vcard-dark', compact('card_details', 'plan_details', 'business_card_details', 'feature_details', 'service_details', 'galleries_details', 'payment_details', 'business_hours', 'settings', 'shareComponent', 'shareContent', 'config', 'enquiry_button'));
                    } else if ($card_details->theme_id == "7ccc432a06vho") {
                        return view('vcard.classic-portfolio-light', compact('card_details', 'plan_details', 'business_card_details', 'feature_details', 'service_details', 'galleries_details', 'payment_details', 'business_hours', 'settings', 'shareComponent', 'shareContent', 'config', 'enquiry_button'));
                    }
                } else {
                    alert()->error(trans('Sorry, Please fill basic business details.'));
                    return redirect()->route('user.company.details', $id);
                }
            }
        } else {
            http_response_code(404);
            return view('errors.404');
        }
    }

    // Create Card
    public function CreateCard()
    {
        $themes = Theme::where('theme_description', 'Web-landing page')->where('status', 1)->get();
        $settings = Setting::where('status', 1)->first();
        $cards = BusinessCard::where('user_id', Auth::user()->user_id)->where('card_status', 'activated')->count();

        // dd($themes);
        $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
        $plan_details = json_decode($plan->plan_details);
	
	    if($plan_details->no_of_vcards == 999) {
            $no_cards = 999999;
        } else {
            $no_cards = $plan_details->no_of_vcards;
        }

        if ($cards <= $no_cards) {
            return view('user.cards.create-card', compact('themes', 'settings', 'plan_details'));
        } else {
            alert()->error(trans('Maximum card creation limit is exceeded, Please upgrade your plan.'));
            return redirect()->route('user.cards');
        }
    }

    // Save card
    public function saveBusinessCard(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'theme_id' => 'required',
            'card_color' => 'required',
            'card_lang' => 'required',
            'cover' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:' . env("SIZE_LIMIT") . '30240',
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:' . env("SIZE_LIMIT") . '30240',
            'title' => 'required',
            'subtitle' => 'required',
            'description' => 'required',
        ]);

        if ($validator->fails()) {
            alert()->error(trans('Some fields missing or cover/logo size is large.'));
            return back();
        }

        $cardId = uniqid();
        if ($request->link) {
            $personalized_link = $request->link;
        } else {
            $personalized_link = $cardId;
        }
        $cards = BusinessCard::where('user_id', Auth::user()->user_id)->where('card_status', 'activated')->count();
        $user_details = User::where('user_id', Auth::user()->user_id)->first();
        $plan_details = json_decode($user_details->plan_details, true);

        $logo = '/backend/img/vCards/' . 'IMG-' . uniqid() . '-' . str_replace(' ', '-', $request->logo->getClientOriginalName()) . '.' . $request->logo->extension();
        $cover = '/backend/img/vCards/' . 'IMG-' . uniqid() . '-' . str_replace(' ', '-', $request->cover->getClientOriginalName()) . '.' . $request->cover->extension();

        $request->logo->move(public_path('backend/img/vCards'), $logo);
        $request->cover->move(public_path('backend/img/vCards'), $cover);

        $card_url = strtolower(preg_replace('/\s+/', '-', $personalized_link));

        $current_card = BusinessCard::where('card_url', $card_url)->count();

	if($plan_details['no_of_vcards'] == 999) {
            $no_cards = 999999;
        } else {
            $no_cards = $plan_details['no_of_vcards'];
        }

        if ($current_card == 0) {
            // Checking, If the user plan allowed card creation is less than created card.
            if ($cards < $no_cards) {
                try {
                    $card_id = $cardId;
                    $card = new BusinessCard();
                    $card->card_id = $card_id;
                    $card->user_id = Auth::user()->user_id;
                    $card->theme_id = $request->theme_id;
                    $card->theme_color = $request->card_color;
                    $card->card_lang = $request->card_lang;
                    $card->cover = $cover;
                    $card->profile = $logo;
                    $card->card_url = $card_url;
                    $card->card_type = 'vcard';
                    $card->title = $request->title;
                    $card->sub_title = $request->subtitle;
                    $card->description = $request->description;
                    $card->save();

                    alert()->success(trans('New Business Setup Created Successfully!'));
                    return redirect()->route('user.social.links', $card_id);
                } catch (\Exception $th) {
                    alert()->error(trans('Sorry, personalized link was already registered.'));
                    return redirect()->route('user.create.card');
                }
            } else {
                alert()->error(trans('Maximum card creation limit is exceeded, Please upgrade your plan to add more card(s).'));
                return redirect()->route('user.create.card');
            }
        } else {
            alert()->error(trans('Sorry, personalized link was already registered.'));
            return redirect()->route('user.create.card');
        }
    }

    // Create Portfolio
    public function CreatePortfolio()
    {
        
        $themes = Theme::where('theme_description', 'portfolios')->where('status', 1)->get();
        $settings = Setting::where('status', 1)->first();
        $portfolios = Portfolio::where('user_id', Auth::user()->user_id)->where('portfolio_status', 'activated')->count();
        // dd($themes);
        $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
        $plan_details = json_decode($plan->plan_details);
	
	    if($plan_details->no_of_vcards == 999) {
            $no_portfolios = 999999;
        } else {
            $no_portfolios = $plan_details->no_of_vcards;
        }

        if ($portfolios <= $no_portfolios) {
            return view('user.portfolio.create', compact('themes', 'settings', 'plan_details'));
        } else {
            alert()->error(trans('Maximum portfolio creation limit is exceeded, Please upgrade your plan.'));
            return redirect()->route('user.create.portfolio');
        }
    }

    // Save portfolio
    public function savePortfolio(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'theme_id' => 'required',
            'portfolio_color' => 'required',
            'portfolio_lang' => 'required',
            'cover' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:' . env("SIZE_LIMIT") . '',
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:' . env("SIZE_LIMIT") . '',
            'title' => 'required',
            'subtitle' => 'required',
            'description' => 'required',
        ]);

        // dd("Validation", $validator);

        if ($validator->fails()) {
            alert()->error(trans('Something went wrong.'));
            return back();
        }

        $portfolioId = uniqid();
        if ($request->link) {
            $personalized_link = $request->link;
        } else {
            $personalized_link = $portfolioId;
        }
        $portfolios = Portfolio::where('user_id', Auth::user()->user_id)->where('portfolio_status', 'activated')->count();
        $user_details = User::where('user_id', Auth::user()->user_id)->first();
        $plan_details = json_decode($user_details->plan_details, true);

        $logo = '/backend/img/portfolio/' . 'IMG-' . uniqid() . '-' . str_replace(' ', '-', $request->logo->getClientOriginalName()) . '.' . $request->logo->extension();
        $cover = '/backend/img/portfolio/' . 'IMG-' . uniqid() . '-' . str_replace(' ', '-', $request->cover->getClientOriginalName()) . '.' . $request->cover->extension();

        $request->logo->move(public_path('backend/img/portfolio'), $logo);
        $request->cover->move(public_path('backend/img/portfolio'), $cover);

        $portfolio_url = strtolower(preg_replace('/\s+/', '-', $personalized_link));

        $current_portfolio = Portfolio::where('portfolio_url', $portfolio_url)->count();

	    if($plan_details['no_of_portfolio'] == 999) {
            $no_portfolios = 999999;
        } else {
            $no_portfolios = $plan_details['no_of_portfolio'];
        }

        if ($current_portfolio == 0) {
            // Checking, If the user plan allowed card creation is less than created card.
            if ($portfolios < $no_portfolios) {
                try {
                    $portfolio_id = $portfolioId;
                    $portfolio = new Portfolio();
                    $portfolio->card_id = $portfolio_id;
                    $portfolio->user_id = Auth::user()->user_id;
                    $portfolio->theme_id = $request->theme_id;
                    $portfolio->theme_color = $request->portfolio_color;
                    $portfolio->portfolio_lang = $request->portfolio_lang;
                    $portfolio->cover = $cover;
                    $portfolio->profile = $logo;
                    $portfolio->portfolio_url = $portfolio_url;
                    $portfolio->portfolio_type = 'portfolio';
                    $portfolio->title = $request->title;
                    $portfolio->sub_title = $request->subtitle;
                    $portfolio->description = $request->description;
                    $portfolio->save();

                    alert()->success(trans('New Business Setup Created Successfully!'));
                    return redirect()->route('user.social.links', $portfolio_id);
                } catch (\Exception $th) {
                    alert()->error(trans('Sorry, personalized link was already registered.'));
                    return redirect()->route('user.create.portfolio');
                }
            } else {
                alert()->error(trans('Maximum card creation limit is exceeded, Please upgrade your plan to add more card(s).'));
                return redirect()->route('user.create.portfolio');
            }
        } else {
            alert()->error(trans('Sorry, personalized link was already registered.'));
            return redirect()->route('user.create.portfolio');
        }
    }

    // Social Links
    public function socialLinks()
    {
        $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
        $settings = Setting::where('status', 1)->first();
        $plan_details = json_decode($plan->plan_details);

        return view('user.cards.social-links', compact('plan_details', 'settings'));
    }

    // Save social links
    public function saveSocialLinks(Request $request, $id)
    {
        $business_card = BusinessCard::where('card_id', $id)->first();

        if ($business_card == null) {
            return view('errors.404');
        } else {
            if ($request->icon != null) {
                BusinessField::where('card_id', $id)->delete();
                $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
                $plan_details = json_decode($plan->plan_details);

                if (count($request->icon) <= $plan_details->no_of_features) {
                    for ($i = 0; $i < count($request->icon); $i++) {
                        if (isset($request->icon[$i]) && isset($request->label[$i]) && isset($request->value[$i])) {
                            
                            
                            $customContent = $request->value[$i];
                            
                            
                            if($request->type[$i] == 'youtube') {
                              $customContent = str_replace('https://www.youtube.com/watch?v=','', $request->value[$i]);
                            }
                            
                            if($request->type[$i] == 'map') {
			                  if(substr($request->value[$i], 0, 3) == 'pb=') {
            				    $customContent = $request->value[$i];
            			      } else {
                              	$customContent = str_replace('<iframe src="','', $request->value[$i]);
                              	$customContent = substr($customContent, 0, strpos($customContent, '" '));
                              	$customContent = str_replace('https://www.google.com/maps/embed?', '', $customContent);
                              }
            			    }
                        
                            
                            $field = new BusinessField();
                            $field->card_id = $id;
                            $field->type = $request->type[$i];
                            $field->icon = $request->icon[$i];
                            $field->label = $request->label[$i];
                            $field->content = $customContent;
                            $field->position = $i + 1;
                            $field->save();
                            
                        } else {
                            alert()->error(trans('Atleast add one feature.'));
                            return redirect()->route('user.social.links', $id);
                        }
                    }
                    alert()->success(trans('features details updated'));
                    return redirect()->route('user.payment.links', $id);
                } else {
                    alert()->error(trans('You have reached plan features limited.'));
                    return redirect()->route('user.social.links', $id);
                }
            } else {
                alert()->error(trans('Atleast add one feature.'));
                return redirect()->route('user.social.links', $id);
            }
        }
    }

    // Payment links
    public function paymentLinks()
    {
        $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
        $settings = Setting::where('status', 1)->first();
        $plan_details = json_decode($plan->plan_details);

        return view('user.cards.payment-links', compact('plan_details', 'settings'));
    }

    // Save payment links
    public function savePaymentLinks(Request $request, $id)
    {
        $business_card = BusinessCard::where('card_id', $id)->first();

        if ($business_card == null) {
            return view('errors.404');
        } else {
            if ($request->icon != null) {
                Payment::where('card_id', $id)->delete();
                $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
                $plan_details = json_decode($plan->plan_details);

                if (count($request->icon) <= $plan_details->no_of_payments) {
                    for ($i = 0; $i < count($request->icon); $i++) {
                        if (isset($request->icon[$i]) && isset($request->label[$i]) && isset($request->value[$i])) {
                            $payment = new Payment();
                            $payment->card_id = $id;
                            $payment->type = $request->type[$i];
                            $payment->icon = $request->icon[$i];
                            $payment->label = $request->label[$i];
                            $payment->content = $request->value[$i];
                            $payment->position = $i + 1;
                            $payment->save();
                        } else {
                            alert()->error(trans('Please fill all required fields.'));
                            return redirect()->route('user.payment.links', $id);
                        }
                    }
                    alert()->success(trans('Payment details updated'));
                    return redirect()->route('user.services', $id);
                } else {
                    alert()->error(trans('You have reached plan payments limited.'));
                    return redirect()->route('user.payment.links', $id);
                }
            } else {
                alert()->success(trans('Payment details updated'));
                return redirect()->route('user.services', $id);
            }
        }
    }

    // Services
    public function services()
    {
        $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
        $plan_details = json_decode($plan->plan_details);
        $media = Medias::where('user_id', Auth::user()->user_id)->orderBy('id', 'desc')->get();
        $settings = Setting::where('status', 1)->first();

        return view('user.cards.services', compact('plan_details', 'settings', 'media'));
    }

    // Save services
    public function saveServices(Request $request, $id)
    {
        $business_card = BusinessCard::where('card_id', $id)->first();

        if ($business_card == null) {
            return view('errors.404');
        } else {
            $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
            $plan_details = json_decode($plan->plan_details);

            if ($request->service_name != null) {

                if (count($request->service_name) <= $plan_details->no_of_services) {

                    for ($i = 0; $i < count($request->service_name); $i++) {
                        $service = new Service();
                        $service->card_id = $id;
                        $service->service_name = $request->service_name[$i];
                        $service->service_image =  $request->service_image[$i];
                        $service->service_description = $request->service_description[$i];
                        $service->enable_enquiry = $request->enquiry[$i];
                        $service->save();
                    }
                    alert()->success(trans('Services details updated'));
                    return redirect()->route('user.galleries', $id);
                } else {
                    alert()->error(trans('You have reached plan limit.'));
                    return redirect()->route('user.services', $id);
                }
            } else {
                //Skipping...
                alert()->success(trans('Services details updated'));
                return redirect()->route('user.galleries', $id);
            }
        }
    }

    // Galleries
    public function galleries()
    {
        $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
        $plan_details = json_decode($plan->plan_details);
        $media = Medias::where('user_id', Auth::user()->user_id)->orderBy('id', 'desc')->get();
        $settings = Setting::where('status', 1)->first();

        return view('user.cards.galleries', compact('plan_details', 'media', 'settings'));
    }

    // Save Gallery Images
    public function saveGalleries(Request $request, $id)
    {

        $business_card = BusinessCard::where('card_id', $id)->first();

        if ($business_card == null) {
            return view('errors.404');
        } else {
            $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
            $plan_details = json_decode($plan->plan_details);

            if ($request->caption != null) {

                if (count($request->caption) <= $plan_details->no_of_galleries) {
                    for ($i = 0; $i < count($request->caption); $i++) {
                        $gallery = new Gallery();
                        $gallery->card_id = $id;
                        $gallery->caption = $request->caption[$i];
                        $gallery->gallery_image = $request->gallery_image[$i];
                        $gallery->save();
                    }

                    alert()->success(trans('Gallery images updated'));
                    return redirect()->route('user.business.hours', $id);
                } else {
                    alert()->error(trans('You have reached plan limit.'));
                    return redirect()->route('user.galleries', $id);
                }
            } else {
                alert()->success(trans('Gallery images updated'));
                return redirect()->route('user.business.hours', $id);
            }
        }
    }

    // Business Hours
    public function businessHours()
    {
        $settings = Setting::where('status', 1)->first();

        return view('user.cards.business-hours', compact('settings'));
    }

    // Save business hours
    public function saveBusinessHours(Request $request, $id)
    {
        $business_card = BusinessCard::where('card_id', $id)->first();

        if ($business_card == null) {
            return view('errors.404');
        } else {
            if ($request->monday_closed == "on") {
                $monday = "Closed";
            } else {
                $monday = $request->monday_open . " - " . $request->monday_closing;
            }

            if ($request->tuesday_closed == "on") {
                $tuesday = "Closed";
            } else {
                $tuesday = $request->tuesday_open . " - " . $request->tuesday_closing;
            }

            if ($request->wednesday_closed == "on") {
                $wednesday = "Closed";
            } else {
                $wednesday = $request->wednesday_open . " - " . $request->wednesday_closing;
            }

            if ($request->thursday_closed == "on") {
                $thursday = "Closed";
            } else {
                $thursday = $request->thursday_open . " - " . $request->thursday_closing;
            }

            if ($request->friday_closed == "on") {
                $friday = "Closed";
            } else {
                $friday = $request->friday_open . " - " . $request->friday_closing;
            }

            if ($request->saturday_closed == "on") {
                $saturday = "Closed";
            } else {
                $saturday = $request->saturday_open . " - " . $request->saturday_closing;
            }

            if ($request->sunday_closed == "on") {
                $sunday = "Closed";
            } else {
                $sunday = $request->sunday_open . " - " . $request->sunday_closing;
            }

            if ($request->always_open == "on") {
                $always_open = "Opening";
            } else {
                $always_open = "Closed";
            }

            if ($request->is_display == "on") {
                $is_display = 0;
            } else {
                $is_display = 1;
            }

            $businessHours = new BusinessHour();
            $businessHours->card_id = $id;
            $businessHours->Monday = $monday;
            $businessHours->Tuesday = $tuesday;
            $businessHours->Wednesday = $wednesday;
            $businessHours->Thursday = $thursday;
            $businessHours->Friday = $friday;
            $businessHours->Saturday = $saturday;
            $businessHours->Sunday = $sunday;
            $businessHours->is_always_open = $always_open;
            $businessHours->is_display = $is_display;
            $businessHours->save();
            alert()->success(trans('Your Business Setup is Ready.'));
            return redirect()->route('user.cards');
        }
    }

    // Skip business hours
    public function skipAndSave()
    {
        alert()->success(trans('Your Business Setup is Ready.'));
        return redirect()->route('user.cards');
    }

    // Card Status Page
    public function cardStatus(Request $request, $id)
    {
        $businessCard = BusinessCard::where('card_id', $id)->first();

        if ($businessCard == null) {
            return view('errors.404');
        } else {
            $business_card = BusinessCard::where('user_id', Auth::user()->user_id)->where('card_id', $id)->first();

            if ($business_card == null) {
                return view('errors.404');
            } else {
                if ($business_card->card_status == 'inactive') {
                    $plan = User::where('user_id', Auth::user()->user_id)->first();
                    $active_plan = json_decode($plan->plan_details);
                    $no_of_features = BusinessField::where('card_id', $id)->count();
                    $no_of_galleries = Gallery::where('card_id', $id)->count();
                    $no_of_payments = Payment::where('card_id', $id)->count();
                    $no_of_services = Service::where('card_id', $id)->count();
                    $no_of_products = StoreProduct::where('card_id', $id)->count();
                    if ($no_of_services <= $active_plan->no_of_services && $no_of_galleries <= $active_plan->no_of_galleries && $no_of_features <= $active_plan->no_of_features && $no_of_payments <= $active_plan->no_of_payments && $no_of_products <= $active_plan->no_of_services) {
                        $cards = BusinessCard::where('user_id', Auth::user()->user_id)->where('card_status', 'activated')->count();

                        $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
                        $plan_details = json_decode($plan->plan_details);

                        if ($cards < $plan_details->no_of_vcards) {
                            BusinessCard::where('user_id', Auth::user()->user_id)->where('card_id', $id)->update([
                                'card_status' => 'activated',
                            ]);
                            alert()->success(trans('Your Business Setup Enabled'));
                            return redirect()->route('user.cards');
                        } else {
                            alert()->error(trans('Maximum card creation limit is exceeded, Please upgrade your plan.'));
                            return redirect()->route('user.cards');
                        }
                    } else {
                        $cards = BusinessCard::where('user_id', Auth::user()->user_id)->where('card_status', 'activated')->count();

                        $plan = DB::table('users')->where('user_id', Auth::user()->user_id)->where('status', 1)->first();
                        $plan_details = json_decode($plan->plan_details);

                        if ($cards < $plan_details->no_of_vcards) {
                            return redirect()->route('user.edit.card', $id)->with('errors', 'Your plan was downgraded.');
                        } else {
                            alert()->error(trans('Maximum card creation limit is exceeded, Please upgrade your plan.'));
                            return redirect()->route('user.cards');
                        }
                    }
                } else {
                    BusinessCard::where('user_id', Auth::user()->user_id)->where('card_id', $id)->update([
                        'card_status' => 'inactive',
                    ]);
                    alert()->success(trans('Your Business Setup Disabled'));
                    return redirect()->route('user.cards');
                }
            }
        }
    }

    // Checkout Page
    public function checkout(Request $request, $id)
    {
        $selected_plan = Plan::where('plan_id', $id)->where('status', 1)->first();
        if ($selected_plan == null) {
            alert()->error(trans('Your current plan is not available. Choose another plan.'));
            return redirect()->route('user.plans');
        } else {
            $config = DB::table('config')->get();

            if ($selected_plan == null) {
                return view('errors.404');
            } else {
    
                if ($selected_plan->plan_price == 0) {
                    if(Auth::user()->billing_name == "") {
                        return redirect()->route('user.billing', $id);
                    } else {

                    $invoice_details = [];

                    // dd($invoice_details);

                    $invoice_details['from_billing_name'] = $request->from_billing_name;
                    $invoice_details['from_billing_address'] = $request->from_billing_address;
                    $invoice_details['from_billing_city'] = $request->from_billing_city;
                    $invoice_details['from_billing_state'] = $request->from_billing_state;
                    $invoice_details['from_billing_zipcode'] = $request->from_billing_zipcode;
                    $invoice_details['from_billing_country'] = $request->from_billing_country;
                    $invoice_details['from_vat_number'] = $request->from_vat_number;
                    $invoice_details['from_billing_phone'] = $request->from_billing_phone;
                    $invoice_details['from_billing_email'] = $request->from_billing_email;

                    $invoice_details['to_billing_name'] = $request->billing_name;
                    $invoice_details['to_billing_address'] = $request->billing_address;
                    $invoice_details['to_billing_city'] = $request->billing_city;
                    $invoice_details['to_billing_state'] = $request->billing_state;
                    $invoice_details['to_billing_zipcode'] = $request->billing_zipcode;
                    $invoice_details['to_billing_country'] = $request->billing_country;
                    $invoice_details['to_billing_phone'] = $request->billing_phone;
                    $invoice_details['to_billing_email'] = $request->billing_email;
                    $invoice_details['to_vat_number'] = $request->vat_number;
                    $invoice_details['tax_name'] = $request->tax_name;
                    $invoice_details['tax_type'] = $request->tax_type;
                    $invoice_details['tax_value'] = $request->tax_value;
                    $invoice_details['invoice_amount'] = 0;
                    $invoice_details['subtotal'] = 0;
                    $invoice_details['tax_amount'] = 0;

                    $transaction = new Transaction();
                    $transaction->gobiz_transaction_id = uniqid();
                    $transaction->transaction_date = now();
                    $transaction->transaction_id = uniqid();
                    $transaction->user_id = Auth::user()->id;
                    $transaction->plan_id = $selected_plan->plan_id;
                    $transaction->description = $selected_plan->plan_name . " Plan";
                    $transaction->payment_gateway_name = "FREE";
                    $transaction->transaction_amount = $selected_plan->plan_price;
                    // $transaction->transaction_currency = $config[1]->config_value;
                    $transaction_currency = $config->where('config_key', 'transaction_currency')->first();

                    if ($transaction_currency) {
                        $transaction->transaction_currency = $transaction_currency->config_value;
                    } else {
                        // Handle the case when the configuration value is missing or null
                        // You can assign a default value or take appropriate action
                        $transaction->transaction_currency = 'default_currency';
                    }

                    $transaction->invoice_details = json_encode($invoice_details);
                    $transaction->payment_status = "SUCCESS";
                    $transaction->save();

                    $plan_validity = Carbon::now();
                    $plan_validity->addDays($selected_plan->validity);
                    User::where('user_id', Auth::user()->user_id)->update([
                        'plan_id' => $id,
                        'term' => "9999",
                        'plan_validity' => $plan_validity,
                        'plan_activation_date' => now(),
                        'plan_details' => $selected_plan,
                    ]);
                    // Making all cards inactive, For Plan change
                    BusinessCard::where('user_id', Auth::user()->user_id)->update([
                        'card_status' => 'inactive',
                    ]);
                    alert()->success(trans("FREE Plan activated!"));
                    return redirect()->back();
                }
            }
            else {
                $settings = Setting::where('status', 1)->first();
                $config = DB::table('config')->get();
                // $currency = Currency::where('iso_code', $config[1]->config_value)->first();
                // $currency = array('aed'=>'AED','afn'=>'&#1547;','all'=>'&#76;&#101;&#107;','amd'=>'AMD','ang'=>'&#402;','aoa'=>'AOA','ars'=>'&#36;','aud'=>'&#36;','awg'=>'&#402;','azn'=>'&#1084;&#1072;&#1085;','bam'=>'&#75;&#77;','bbd'=>'&#36;','bdt'=>'BDT','bgn'=>'&#1083;&#1074;','bhd'=>'BHD','bif'=>'BIF','bmd'=>'&#36;','bnd'=>'&#36;','bob'=>'&#36;&#98;','brl'=>'&#82;&#36;','bsd'=>'&#36;','btn'=>'BTN','bwp'=>'&#80;','byr'=>'&#112;&#46;','bzd'=>'&#66;&#90;&#36;','cad'=>'&#36;','cdf'=>'CDF','chf'=>'&#67;&#72;&#70;','clp'=>'&#36;','cny'=>'&#165;','cop'=>'&#36;','crc'=>'&#8353;','cuc'=>'CUC','cup'=>'&#8369;','cve'=>'CVE','czk'=>'&#75;&#269;','djf'=>'DJF','dkk'=>'&#107;&#114;','dop'=>'&#82;&#68;&#36;','dzd'=>'DZD','egp'=>'&#163;','ern'=>'ERN','etb'=>'ETB','eur'=>'&#8364;','fjd'=>'&#36;','fkp'=>'&#163;','gbp'=>'&#163;','gel'=>'GEL','ggp'=>'&#163;','ghs'=>'&#162;','gip'=>'&#163;','gmd'=>'GMD','gnf'=>'GNF','gtq'=>'&#81;','gyd'=>'&#36;','hkd'=>'&#36;','hnl'=>'&#76;','hrk'=>'&#107;&#110;','htg'=>'HTG','huf'=>'&#70;&#116;','idr'=>'&#82;&#112;','ils'=>'&#8362;','imp'=>'&#163;','inr'=>'&#8377;','iqd'=>'IQD','irr'=>'&#65020;','isk'=>'&#107;&#114;','jep'=>'&#163;','jmd'=>'&#74;&#36;','jod'=>'JOD','jpy'=>'&#165;','kes'=>'KES','kgs'=>'&#1083;&#1074;','khr'=>'&#6107;','kmf'=>'KMF','kpw'=>'&#8361;','krw'=>'&#8361;','kwd'=>'KWD','kyd'=>'&#36;','kzt'=>'&#1083;&#1074;','lak'=>'&#8365;','lbp'=>'&#163;','lkr'=>'&#8360;','lrd'=>'&#36;','lsl'=>'LSL','lyd'=>'LYD','mad'=>'MAD','mdl'=>'MDL','mga'=>'MGA','mkd'=>'&#1076;&#1077;&#1085;','mmk'=>'MMK','mnt'=>'&#8366;','mop'=>'MOP','mro'=>'MRO','mur'=>'&#8360;','mvr'=>'MVR','mwk'=>'MWK','mxn'=>'&#36;','myr'=>'&#82;&#77;','mzn'=>'&#77;&#84;','nad'=>'&#36;','ngn'=>'&#8358;','nio'=>'&#67;&#36;','nok'=>'&#107;&#114;','npr'=>'&#8360;','nzd'=>'&#36;','omr'=>'&#65020;','pab'=>'&#66;&#47;&#46;','pen'=>'&#83;&#47;&#46;','pgk'=>'PGK','php'=>'&#8369;','pkr'=>'&#8360;','pln'=>'&#122;&#322;','prb'=>'PRB','pyg'=>'&#71;&#115;','qar'=>'&#65020;','ron'=>'&#108;&#101;&#105;','rsd'=>'&#1044;&#1080;&#1085;&#46;','rub'=>'&#1088;&#1091;&#1073;','rwf'=>'RWF','sar'=>'&#65020;','sbd'=>'&#36;','scr'=>'&#8360;','sdg'=>'SDG','sek'=>'&#107;&#114;','sgd'=>'&#36;','shp'=>'&#163;','sll'=>'SLL','sos'=>'&#83;','srd'=>'&#36;','ssp'=>'SSP','std'=>'STD','syp'=>'&#163;','szl'=>'SZL','thb'=>'&#3647;','tjs'=>'TJS','tmt'=>'TMT','tnd'=>'TND','top'=>'TOP','try'=>'&#8378;','ttd'=>'&#84;&#84;&#36;','twd'=>'&#78;&#84;&#36;','tzs'=>'TZS','uah'=>'&#8372;','ugx'=>'UGX','usd'=>'&#36;','uyu'=>'&#36;&#85;','uzs'=>'&#1083;&#1074;','vef'=>'&#66;&#115;','vnd'=>'&#8363;','vuv'=>'VUV','wst'=>'WST','xaf'=>'XAF','xcd'=>'&#36;','xof'=>'XOF','xpf'=>'XPF','yer'=>'&#65020;','zar'=>'&#82;','zmw'=>'ZMW');
                $currency = 'ngn';
                $gateways = Gateway::where('is_status', 'enabled')->where('status', 1)->get();
                $plan_price = $selected_plan->plan_price;
                // $tax = $config[25]->config_value;
                $tax = 0;
                $total = ((int)($plan_price) * (int)($tax) / 100) + (int)($plan_price);
                return view('user.checkout.checkout', compact('settings', 'config', 'currency', 'selected_plan', 'gateways', 'total'));
            }
        }
        }
    }



    public function checkLink(Request $request)
    {
        $link = $request->link;
        $is_present = DB::table('business_cards')->where('card_url', $link)->count();
        $resp = [];
        $resp['status'] = 'failed';

        if ($is_present == 0) {
            $resp['status'] = 'success';
        } else {
            $resp['status'] = 'failed';
        }

        return response()->json($resp);
    }
}
