<div class="input-group">
    {{ Form::text('link', null, ['class' => 'form-control', 'placeholder' => trans('labels.link')]) }}
    <span class="input-group-btn">
        <button class="btn btn-primary" type="button" id="LinkSelectorButton"
                data-listing-url="{{ route('control_panel.link_selector.list_types') }}">{{ trans('actions.set') }}</button>
    </span>
</div>

<!-- Modal -->
<div class="modal fade" id="LinkSelectorModal" tabindex="-1" role="dialog" aria-labelledby="#LinkSelectorModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="LinkSelectorModalLabel">{{ trans('labels.link_selector_modal') }}</h4>
            </div>
            <div class="modal-body">
                <div class="form-group" id="LinkTypes">

                </div>
                <div class="form-group">
                    <select id="LinksList" class="form-control" size="5">

                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

@section('js')
    <script>
        $('#LinkSelectorButton').on('click', function(){


            $.ajax({
                url: $(this).attr('data-listing-url'),
                method: 'GET',
                success: function(response){
                    $(this).children('.loading_image').remove();

                    renderLinkTypes(response.content);

                    $('#LinkSelectorModal').modal();
                }
            });
        });

        function renderLinkTypes(links){
            var html = '';

            $.each(links, function(slug, type){
                html += '<label class="radio-inline">' +
                        '<input name="link_type" type="radio" value="' + slug +
                        '" class="link_type" onclick="loadLinks(this)">' +
                        type + '</label>';
            });

            $('#LinkTypes').html(html);
        }
    </script>
@append