@extends('control_panel.layouts.default')

@section('content')
    {{ Form::open(['route' => 'control_panel.products_categories.store', 'class' => 'form-horizontal', 'id' => 'ProductCategoryForm', 'files' => true]) }}

        @include('control_panel.products_categories._form')

    {{ Form::close() }}
@stop