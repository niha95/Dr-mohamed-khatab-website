    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="keywords" content="@yield('meta_keywords', $misc->meta_keywords_locale)">
    <meta name="description" content="@yield('meta_description', $misc->meta_description_locale)">
    <meta name="author" content="{{ $misc->site_name_locale }}">

    @yield('meta')

    <title>@yield('title', $misc->site_name_locale)</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.4.0/css/bootstrap-flipped.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
   
    <link rel="stylesheet" href="{{ asset('assets/site/css/wowslider.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/site/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/site/css/media.css') }}">
    <!--Custom Style-->
    @yield('style')
</head>