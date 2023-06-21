@extends('layouts.user', ['header' => true, 'nav' => true, 'demo' => true, 'settings' => $settings])

@section('content')
    <div class="page-wrapper">
        <div class="container-xl">
            <!-- Page title -->
            <div class="page-header d-print-none">
                <div class="row align-items-center">
                    <div class="col">
                        <div class="page-pretitle">
                            {{ __('Overview') }}
                        </div>
                        <h2 class="page-title">
                            {{ __('Checkout') }}
                        </h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-xl mt-3">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">{{ $planDetails->plan_name }}</h3>
                        <button id="paystack-button" class="btn btn-primary">{{ __('Pay Now') }}</button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        @include('user.includes.footer')
        @push('custom-js')
            <script src="https://js.paystack.co/v1/inline.js"></script>
            <script>
                ! function() {
                    "use strict";
                    var paymentButton = document.getElementById('paystack-button');
                    paymentButton.onclick = function(e) {
                        e.preventDefault();
                        payWithPaystack();
                    }

                    function payWithPaystack() {
                        var handler = PaystackPop.setup({
                            key: "sk_test_beec010972a5e437c0a92c1ab56400473e1e0550",
                            email: "{{ Auth::user()->email }}",
                            amount: "{{ $amountToBePaidKobo ?? '' }}",
                            currency: "{{ $currencyValue ?? '' }}",
                            metadata: {
                                planDetails: "{{ $planId ?? '' }}"
                            },
                            callback: function(response) {
                                window.location = "/paystack-payment-status/" + response.reference;
                            },
                            onClose: function() {
                                alert('Payment canceled');
                            }
                        });
                        handler.openIframe();
                    }
                }();
            </script>
        @endpush
    </div>
@endsection
