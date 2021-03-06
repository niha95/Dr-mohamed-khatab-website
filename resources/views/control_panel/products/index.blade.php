@extends('control_panel.layouts.default')

@section('content')
    @include('control_panel.products._filters')

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">{{ $title }}</h3>
        </div>
        <div class="panel-body">
            @if(!$products->isEmpty())
                <div class="table-responsive">
                    <table class="table table-hover">
                        <tr>
                            <th>#</th>
                            <th>{{ trans('labels.title') }}</th>
                            <th>{{ trans('labels.featured_image') }}</th>
                            <th>{{ trans('labels.status') }}</th>
                            <th></th>
                        </tr>

                        @foreach($products as $i => $product)
                            <tr>
                                <td>{{ $i + 1 }}</td>
                                <td class="text-center">{!! $product->name_translated !!}</td>
                                <td>
                                    @if(!empty($product->image))
                                        <img src="{{ $product->image->thumbFullLink() }}"
                                             alt="{{ $product->name_default }}"
                                             class="img-thumbnail image_tiny"
                                        >
                                    @endif
                                </td>
                                <td>{!! $product->renderStatus() !!}</td>
                                <td nowrap>
                                    <a href="{{ $product->fullUrl() }}" class="btn btn-primary" target="_blank">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                    </a>
                                    <a href="{{ route('control_panel.products.edit', $product->id) }}" class="btn btn-primary">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                    </a>
                                    <a href="javascript: void(0)" data-url="{{ route('control_panel.products.destroy', $product->id) }}"
                                       class="btn btn-danger" onclick="confirmDeleteEntity(this)"
                                    >
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </table>
                </div>

                {{ $products->links() }}
            @else
                <p>{{ trans('messages.no_entities', ['entities' => $title]) }}</p>
            @endif
        </div>
    </div>
@stop

@section('css')
    <link rel="stylesheet" href="{{ asset('assets/control-panel/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/control-panel/css/select2-bootstrap.min.css') }}">
@append

@section('js')
    <script src={{ asset('assets/control-panel/js/select2/select2.full.min.js') }}></script>
    <script>
        $('input[name=categorized]').on('change', function(){
            if($(this).val() == 'specific') {
                $('select[name=categories]').attr('disabled', false);
            } else {
                $('select[name=categories]').attr('disabled', true);
            }
        });

        $('#ProductsCategories').select2({
            width: '100%'
        });

        $('#FilterButton').on('click', function(){
            var filters = $('#EntitiesFilters');

            var url = window.location.href.split('?')[0];

            var data = {};
            var value;

            data.sort = filters.find('select[name=order]').val();

            value = filters.find('input[name=keywords]').val();
            if(value != null && value.trim().length != 0) data.keywords = value.trim();

            value = filters.find('input[name=featured_image]').prop('checked');
            if(value == true) data['has-featured-image'] = true;

            value = filters.find('input[name=categorized]:checked').val();
            switch (value) {
                case 'categorized':
                    data.categorized = true;
                    break;
                case 'uncategorized':
                    data.uncategorized = true;
                    break;
                case 'specific':
                    value = filters.find('select[name=categories]').val();
                    if(value != null && value.length != 0) data.categories = value.join(' ');
            }

            value = filters.find('input[name=status]:checked').val();
            if(value != 'all') data.status = value;

            window.location.href = url + '?' + $.param(data);
        });
    </script>
@append