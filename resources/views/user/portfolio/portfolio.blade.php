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
                        {{ __('Business') }}
                    </h2>
                </div>

                @if (env('APP_TYPE') == 'PORTFOLIO')
                <div class="col-auto ms-auto d-print-none">
                    <div class="d-flex">
                        <a href="{{ route('user.create.card') }}" class="btn btn-primary">
                            <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <line x1="12" y1="5" x2="12" y2="19" />
                                <line x1="5" y1="12" x2="19" y2="12" /></svg>
                            {{ ('Create Portfolio') }}
                        </a>
                    </div>
                </div>
                @endif

                @if (env('APP_TYPE') == 'STORE')
                <div class="col-auto ms-auto d-print-none">
                    <div class="d-flex">
                        <a href="{{ route('user.create.store') }}" class="btn btn-primary">
                            <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <line x1="12" y1="5" x2="12" y2="19" />
                                <line x1="5" y1="12" x2="19" y2="12" /></svg>
                            {{ ('Create E-commerce Store') }}
                        </a>
                    </div>
                </div>
                @endif

                @if (env('APP_TYPE') == 'BOTH')
                <!-- Page title actions -->
                <div class="col-auto ms-auto d-print-none">
                    <div class="dropdown">
                        <button type="button" class="btn btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-plus" width="24"
                                height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                            {{ __('Create') }}
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="{{ route('user.create.card') }}">
                                {{ __('Web-landing Page') }}
                            </a>
                            <a class="dropdown-item" href="{{ route('user.create.store') }}">
                                {{ __('E-commerce Store') }}
                            </a>
                        </div>
                    </div>
                </div>
                @endif
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-deck row-cards">
                <div class="col-sm-12 col-lg-12">
                    <div class="card">
                        <div class="table-responsive px-2 py-2">
                            <table class="table table-vcenter card-table" id="table">
                                <thead>
                                    <tr>
                                        <th>{{ __('S.No') }}</th>
                                        <th>{{ __('Business ID') }}</th>
                                        <th>{{ __('Business Name') }}</th>
                                        <th>{{ __('Type') }}</th>
                                        <th>{{ __('Validity Upto') }}</th>
                                        <th>{{ __('Status') }}</th>
                                        <th class="w-1">{{ __('Actions') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if (!empty($portfolios) && $portfolios->count())
                                    @foreach ($portfolios as $portfolio)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $portfolio->portfolio_id }}</td>
                                        <td>{{ $portfolio->title }}</td>
                                        <td>{{ $portfolio->portfolio_type == 'webiste' ? 'portfolio' : 'E-commerce Store' }}</td>
                                        <td class="text-muted">
                                            {{ date('d/M/Y', strtotime($portfolio->plan_validity)) }}</td>
                                        <td class="text-muted">
                                            @if ($portfolio->portfolio_status == 'inactive')
                                            <span class="badge bg-red">{{ __('Inactive') }}</span
                                            @else
                                            <span class="badge bg-green">{{ __('Active') }}</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="btn-list flex-nowrap">
                                                <a class="open-qr btn btn-primary btn-sm" data-id="{{ $portfolio->porfolio_url }}"
                                                    href="#openQR">{{ __('Scan') }}</a>
                                                <a class="btn btn-primary btn-sm"
                                                    href="{{ route('user.edit.card', $portfolio->portfolio_id)}}">{{ __('Edit') }}</a>
                                                <a class="btn btn-primary btn-sm"
                                                    href="{{ route('user.view.preview', $portfolio->portfolio_id)}}"
                                                    target="_blank">{{ __('Preview') }}</a>
                                                <a class="btn btn-primary btn-sm"
                                                    href="{{ URL::to('/')."/".$portfolio->porfolio_url }}"
                                                    target="_blank">{{ __('Live') }}</a>
                                                @if ($portfolio->portfolio_status == 'activated')
                                                <a class="open-model btn btn-primary btn-sm"
                                                    data-id="{{ $portfolio->portfolio_id }}"
                                                    href="#openModel">{{ __('Disable') }}</a>
                                                @else
                                                <a class="open-model btn btn-primary btn-sm"
                                                    data-id="{{ $portfolio->portfolio_id }}"
                                                    href="#openModel">{{ __('Enable') }}</a>
                                                @endif
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                    @else
                                    <tr class="font-weight-bold">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>{{ __('No Business Found.') }}</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('user.includes.footer')
</div>

<div class="modal modal-blur fade" id="deleteModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="modal-title">{{ __('Are you sure?')}}</div>
                <div>{{ __('If you proceed, you will enabled/disabled this card.')}}</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link link-secondary me-auto"
                    data-bs-dismiss="modal">{{ __('Cancel')}}</button>
                <a class="btn btn-danger" id="plan_id">{{ __('Yes, proceed')}}</a>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-blur fade" id="openQR" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">{{ __('Scan Business Card / Store')}}</div>
            </div>
            <div class="modal-body text-center">
                <img id="cardURL">
            </div>
        </div>
    </div>
</div>
@endsection
