@extends('site.layouts.default')

@section('content')
     <section class="inner-obet-slider">
            <div class="container">
                <div id="demo" class="carousel slide" data-ride="carousel">

                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img src="{{ asset('assets/site/images/about-01.jpg') }}" alt="">
                    </div>
                    </div>
                </div>
            </div>
        </section>

    <section class="page-content">
        <div class="container">
            <h2>{{$title}}</h2>
            @if(!$products->isEmpty())
            <div class="row">
                @foreach($products as $product)
                <div class="col-sm-6 col-xs-12">
                    <div class="tours">
                        @if($product->image)<img class="img-fluid" src="{{ $product->image->imageFullLink() }}">@endif
                        <ul class="list-unstyled" style="padding-left: 27px">
                                <li class="list-item" ><h3><a href="{{ route('site.products.show', $product->slug) }}">{{ $product->name_locale }}</a></h3></li>
                                <li class="list-item">{{ $product->price }} $</li>
                               
                            </ul>
                    </div>
                </div>
                @endforeach
            </div>

            <div class="opt-pagination">
                <ul class="pagination">{{ $products->links() }}</ul>
            </div>
            @endif
        </div>
    </section>
@endsection