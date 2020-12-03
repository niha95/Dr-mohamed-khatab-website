@extends('site.layouts.default')

@section('content')
  <section class="page-content">
            <div class="container list-project">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h3>خدماتنا</h3>
                        <hr class="line1">
                        <div class="row">
                              @if(!$products->isEmpty())
                              @foreach($products as $product)
                            <div class="col-sm-6 col-md-4 col-xs-12">
                                
                                <div class="">
                                    @if($product->image)<img class="img-fluid" src="{{ $product->image->imageFullLink() }}">@endif
                                    <h4>{{ $product->name_locale }}</h4>
                                    <p>{{ str_limit(strip_tags($product->description_locale), 100) }}</p>
                                    <a href="{{ route('site.products.show', $product->slug) }}" class="btn">اعرف المزيد</a>
                                </div>
                            </div>
                             @endforeach
                            @endif
                        </div>
                    </div>
                </div>
                 <!-- pagination-->
            <div class="opt-pagination">
                <ul class="pagination"><li class="page-item">{{ $products->links() }}</li></ul>
            </div>
            </div>
  </section>

           
@endsection