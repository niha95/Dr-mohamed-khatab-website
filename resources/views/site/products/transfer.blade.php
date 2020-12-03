@extends('site.layouts.default')

@section('content')
    <section class="page-content">
            <div class="container">
                @if(!$products->isEmpty())
                     @foreach($products as $product)
              <ul class="list-unstyled transfer">
                  <li class="list-item">
                     @if($product->image)<img class="img-fluid" src="{{ $product->image->imageFullLink() }}">@endif
                    <div class="data-service" style="width: 50%;">
                       <h3><a href="{{ route('site.products.show', $product->slug) }}">{{ $product->name_locale }}</a></h3>
                        <p>
                            {{ str_limit(strip_tags($product->description_locale), 100) }} 
                        </p>
                    </div>
                    <div class="price">
                        <p>from to</p>
                        <p>{{ $product->price }}</p>
                    </div>
                 </li>
            </ul>
                     @endforeach
            </div>
                    <div class="opt-pagination">
                        <ul class="pagination">{{ $products->links() }}</ul>
                    </div>
                    @endif
                </div>

    </section>
@endsection