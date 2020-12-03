<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}" @if(app()->getLocale() == 'ar') dir="rtl" @else dir="ltr" @endif>

@include('site.layouts.partials._head')

<body class="container-fluid page-body">
    @include('site.layouts.partials._header')
    @include('site.layouts.partials._navbar')
 @include('site.layouts.partials._slider')
    @yield('content')

    @include('site.layouts.partials._footer')

    @include('site.layouts.partials._scripts')
</body>
</html>