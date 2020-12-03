@extends('site.layouts.default')

@section('content')
    @if(!$category->products->isEmpty())
    <div class="meals">
        <div class="container">
            <div class="row">
                @foreach($category->products()->paginate(12) as $product)
                    <div class="col-sm-6 ">
                        <div class="row meal">
                            <div class="col-sm-8">
                                <h3>{{ $product->name_locale }}</h3>
                                <p>{{ str_limit(strip_tags($product->description_locale), 150) }} <a href="{{route('site.product', [$product->slug])}}">المزيد</a></p>
                            </div>
                            @if($product->image)
                                <div class="col-sm-4">
                                    <img src="{{ $product->image->thumbFullLink() }}" alt="{{ $product->name_locale }}">
                                </div>
                            @endif
                        </div>
                    </div>
                @endforeach
            </div>
            <div>{{ $category->products()->paginate(12)->links() }}</div>
        </div>
    </div>
    @endif
@endsection