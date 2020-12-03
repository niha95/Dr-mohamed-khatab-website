@extends('site.layouts.default')

@section('title', $page->title_locale)

@if(!empty($page->meta_description_locale))
    @section('meta_description', $page->meta_description_locale)
@endif

@if(!empty($page->meta_keywords_locale))
    @section('meta_keywords', $page->meta_keywords_locale)
@endif

@section('meta')
    <meta property="og:url" content="{{ url()->current() }}">
    <meta property="og:title" content="{{ $page->title_locale }}">
    <meta property="og:description" content="{{ $page->meta_description_locale }}">
    @if($page->featuredImage)
        <meta property="og:image" content="{{ $page->featuredImage->imageFullLink() }}">
    @endif
@append

@section('content')
   <!-- <div class="feature-img">
        <img src="{{ asset('assets/site/images/slide3.jpg') }}" class="img-fluid" alt="{{$page->title_locale}}">
    </div>
-->
    <section class="about-page" style="margin-top: 148px;">
        <div class="container">
            <div class="row">
                {!! $content !!}
            </div>
        </div>
    </section>

@append