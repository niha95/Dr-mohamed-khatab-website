@extends('site.layouts.default')

@section('title', $product->name_locale)

@section('content')



           <section class="page-content">
            <div class="container details">
                <div class="row">
                  
                    <div class="col-md-8 col-sm-12">
                        <h2>{{ $product->name_locale }}</h2>
                        <img class="img-fluid" src="{{ $product->image->imageFullLink() }}">
                        <p>
                           {!! $product->description_locale !!}
                        </p>
                         @if($product->vedio)<iframe src="{{ $product->vedio }}">
                         </iframe>
                        @endif
                        <!-- back-end please add-facebook-comment-plugin-here -->
                        
                    </div>
                </div>
            </div>
        </section>
@append
    