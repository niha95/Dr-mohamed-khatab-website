@extends('site.layouts.default')

@section('content')
<section class="welcome-site">
            <div class="container">
                <div class="head-title text-center">
                    <i class="fa fa-user-md" aria-hidden="true"></i>
                    <h3>د / محمد خطاب</h3>
                    <h4>دكتور عظام ومفاصل وعلاج فقرات</h4>
                </div>
                <div class="welcome-body">
                    <div class="row">
                        <div class="col-md-8 col-sm-12">
                            <div class="welcome-content">
                                <h2>{{ $misc->site_word_title_locale }}</h2>
                                <p>
                                    {{ strip_tags($misc->site_word_content_locale) }}
                                </p>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-12">
                            <div class="welcome-img">
                                <img class="img-fluid" src="{{asset('assets/site/images/welcome-img1.png')}}">
                            </div>
                        </div>
                        
                    </div>
                    
                   
                </div>
            </div>
        </section>

        <section class="service-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-12">
                        <h2><img class="img-fluid" src="{{asset('assets/site/images/service-icon.jpg')}}"> خدمات المركز </h2>
                        <ul class="list-unstyled">
                         @foreach($Packages as $fpackage)
                            <li class="list-item">
                                 <a href="{{route('site.page',$fpackage->slug)}}">{{$fpackage->title_locale}}</a>
                            </li>
                             @endforeach
                        </ul>
                    </div>
                    
                    <div class="col-md-8 col-sm-12">
                  
                        <ul class="list-unstyled list-inline">
                        @foreach($Packages as $fpackage)
                            <li class="list-inline-item">
                               <img src="{{ $fpackage->featuredImage->imageFullLink() }}" class="img-responsive">
                                <p class="lead"><a href="{{route('site.page',$fpackage->slug)}}">{{$fpackage->title_locale}}</a></p>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class="info-center">
            <div class="container">
                <h2><img class="img-fluid" src="{{asset('assets/site/images/info-icon.jpg')}}"> معلومات عن خدمات المركز</h2>
                <div class="row">
                 @foreach($featuredPackages as $featuredPage)
                    <div class="col-md-4 col-sm-6 col-xs-12 text-center">
                        <img class="img-fluid" src="{{ $featuredPage->image->imageFullLink() }}">
                        <a href="{{ route('site.products.show', $featuredPage->slug) }}"><p class="lead">{{$featuredPage->name_locale}}</p></a>
                        <p>
                        {{ str_limit(strip_tags($featuredPage->description_locale), 150) }}
                        </p>
                    </div>
                    
                    @endforeach
                </div>
            </div>
        </section>    

              
                <section class="video-section">
            <div class="container">
                <div class="row">

                    <div class="col-md-4 col-sm-12">
                        <h2><img class="img-fluid" src="{{asset('assets/site/images/video-icon.jpg')}}"> فيديوهات </h2>
                        <ul class="list-unstyled">
                         @foreach($veaturedPages as $veaturedPage)
                            <li class="list-item">
                                <a href="">{{$featuredPage->name_locale}}</a>
                            </li>
                           @endforeach
                        </ul>
                    </div>
                    
                    <div class="col-md-8 col-sm-12">
                        <ul class="list-unstyled list-inline">
                         @foreach($veaturedPages as $veaturedPage)
                            <li class="list-inline-item">
                                <iframe src="{{ $veaturedPage->vedio }}">
                                </iframe>
                            </li>
                              @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </section>
                   
@endsection