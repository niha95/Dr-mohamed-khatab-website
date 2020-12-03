@extends('site.layouts.default')

@section('content')
    <div class="feature-img">
        <img src="{{ asset('assets/site/images/tour-banner.jpg') }}" class="img-fluid" alt="optimo-banner">
    </div>

    <section class="tour-page">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12">
                    <h2 class="">{{$title}}</h2>
                    @if(!$products->isEmpty())
                    <div class="row">
                        @foreach($products as $product)
                            <div class="col-sm-6">
                                <div class="tours">
                                    @if($product->image)<img class="img-fluid" src="{{ $product->image->imageFullLink() }}">@endif
                                    <ul class="list-unstyled">
                                        <li class="list-item"><h3><a href="{{ route('site.service.show', $product->slug) }}">{{ $product->name_locale }}</a></h3></li>
                                        <li class="list-item"><i class="fa fa-map-marker" aria-hidden="true"></i> {{ @$product->city->{"name_".app()->getLocale()} }} </li>
                                        {{--<li class="list-item"></li>--}}
                                        <li class="list-item"><span class="price"> from {{ $product->price }} $</span></li>
                                    </ul>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
                @if(count($toursCities))
                <div class="col-md-3 col-sm-12">
                    <p class="choose">choose your destination</p>
                    <ul class="list-unstyled destination">
                        @foreach($toursCities as $tcity)
                        <li class="list-item"><a href="?city={{$tcity->id}}">{{ $tcity->{"name_".app()->getLocale()} }}</a></li>
                        @endforeach
                    </ul>
                </div>
                @endif
            </div>
            <div class="opt-pagination">
                <ul class="pagination">{{ $products->links() }}</ul>
            </div>
            @endif
        </div>
    </section>
@endsection