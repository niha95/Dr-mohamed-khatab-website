<div class="row">
    <div class="col-sm-8">
        @foreach(siteLocales() as $locale)
            <div class="section">
                <a class="section_collapse" role="button" data-toggle="collapse" href="#Section1_{{ $locale }}">&minus;</a>
                <div id="Section1_{{ $locale }}" class="in">
                    @if(count(siteLocales()) > 1)
                        <h2 class="section_title">{{ localizedTitle($locale) }}</h2>
                    @endif
                    <div class="form-group">
                        {{ Form::label('Status_' . $locale, trans('labels.status'), ['class' => 'control-label col-sm-2']) }}
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                {{ Form::radio('status_' . $locale, 'active', true) }} {{ trans('labels.statuses.active') }}
                            </label>
                            <label class="radio-inline">
                                {{ Form::radio('status_' . $locale, 'inactive', false) }} {{ trans('labels.statuses.inactive') }}
                            </label>
                        </div>
                    </div>

                    <hr class="input_separator">

                    <div class="form-group">
                        {{ Form::label('Title_' . $locale, trans('labels.title'), ['class' => 'control-label col-sm-2']) }}
                        <div class="col-sm-10">
                            {{ Form::text('title_' . $locale, null,
                                ['class' => 'form-control', 'id' => 'Title_' . $locale, 'placeholder' => trans('labels.title')]) }}
                        </div>
                    </div>
                </div>
            </div>
        @endforeach

        <div class="section">
            <div class="form-group">
                {{ Form::label('Link', trans('labels.link'), ['class' => 'control-label col-sm-2']) }}
                <div class="col-sm-10">
                    @include('control_panel.common._link_selector')
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div class="section no_form_horizontal">
            <div class="form-group">
                <input type="hidden" name="position" id="Position"
                       value="{{ isset($item) ? $item->position : array_first($positions)->slug }}"
                >

                @if(count($positions) > 1)
                    {{ Form::label('Position', trans('labels.position')) }}

                    <div id="MenuPositions">
                        <?php $j = 0; ?>
                        @foreach($positions as $position)
                            <?php
                                if(old('position')) {
                                    $class = old('position') == $position->slug ? 'selected' : '';
                                } elseif(isset($item)) {
                                    $class = $item->position == $position->slug ? 'selected' : '';
                                } elseif($j++ == 0) {
                                    $class = 'selected';
                                } else {
                                    $class = '';
                                }
                            ?>

                            <div class="menu_position">
                                <a href="javascript:void(0)"
                                   data-position-slug="{{ $position->slug }}"
                                   class="{{ $class }}"
                                   onclick="setMenuPosition(this)"
                                >
                                    <img class="img-thumbnail img-responsive" src="{{ $position->thumbnail }}"
                                         alt="{{ $position->title }}" width="{{ 70 / count($positions) }}%">
                                </a>
                            </div>
                        @endforeach
                    </div>
                @endif
            </div>

            {{ Form::hidden('parent_id', 0) }}

            <div class="form-group">
                {{ Form::label('Icon', trans('labels.icon')) }}
                {{ Form::text('icon', null,
                        ['class' => 'form-control', 'id' => 'Icon', 'placeholder' => trans('labels.icon')]) }}
            </div>
        </div>

        <div class="section no_form_horizontal">
            <div class="form-group">
                {{ Form::label('ParentId', trans('labels.parent')) }}
                {{ Form::select('parent_id', selectPlaceholder($parents, trans('labels.parent')), null,
                    ['class' => 'form-control', 'id' => 'ParentId']) }}
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-12">
                <button type="reset" class="btn btn-danger">{{ trans('actions.reset') }}</button>
                <button type="submit" class="btn btn-primary">{{ trans('actions.save') }}</button>
                <button type="submit" class="btn btn-primary" name="save_and_continue">
                    {{ trans('actions.save_and_continue') }}</button>
            </div>
        </div>
    </div>
</div>

@section('js')
    <script>
        function setMenuPosition(element) {
            element = $(element);

            $('#Position').val(element.attr('data-position-slug'));

            $('.menu_position a').each(function () {
                $(this).removeClass('selected');
            });

            element.addClass('selected');
        }

        $(link_selector).on('ls.link_selected', function(e, data){
            $()
        });
    </script>
@append
