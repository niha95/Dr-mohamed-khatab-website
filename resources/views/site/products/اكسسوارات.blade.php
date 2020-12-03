@extends('site.layouts.default')

@section('content')
<section class="page-content">
            <div class="container">
             <div class="row list-product">
                    
   <div class="col-sm-12 col-xs-12">
                        <h2> الاكسسوارات </h2>
                        <div class="row">
                             @if(!$products->isEmpty())
                              @foreach($products as $product)
                            <div class="col-sm-4  col-xs-6">
                                
                                <div class="item">
                                    <img src="{{ $product->image->imageFullLink() }}" class="img-responsive img-thumbnail">
                                    <a href="{{ route('site.products.show', $product->slug) }}"><p class="lead">{{ $product->name_locale }}</p></a>
                                </div>
                              
                            </div>
                  @endforeach
                            @endif
                        </div>
                    </div>
                     </div>
            </div>
  
  </section>

           
@endsection