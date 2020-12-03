@extends('control_panel.layouts.default')

@section('content')
    {{ Form::model($category, ['route' => ['control_panel.products_categories.update', $category->id],
        'class' => 'form-horizontal', 'id' => 'ProductCategoryForm', 'method' => 'patch', 'files' => true]) }}

        @include('control_panel.products_categories._form')

    {{ Form::close() }}
@stop