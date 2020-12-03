<section class="top-head">&nbsp;</section>
        <header style="
    bottom: 8px;
    left: 0px;
    right: 184px;
">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2 head">
                    <div class="social">
                        <ul class="list-inline list-unstyled">
                             @if($misc->facebook)<li class="list-inline-item"><a href="{{ $misc->facebook }}"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>@endif
                            @if($misc->twitter)<li class="list-inline-item"><a href="{{ $misc->twitter }}"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>@endif
                            @if($misc->GooglePlus)<li class="list-inline-item"><a href="{{ $misc->GooglePlus }}"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></li>@endif
                            @if($misc->youtube) <li class="list-inline-item"><a href="{{ $misc->youtube }}"><i class="fa fa-youtube-square" aria-hidden="true"></i></a></li>@endif
                        </ul>
                    </div>
                    <div class="call-us">
                        <ul class="list-inline list-unstyled">
                            <li class="list-inline-item">
                            @if($misc->phone_numbers_list)
                                <i class="fa fa-phone" aria-hidden="true"></i><span>
                                    {{ $misc->phone_numbers_list[0]->value }}
                                   </span>@endif
                                   </li>
                                  @if($misc->emails_list)
                            <li class="list-inline-item"><i class="fa fa-envelope" aria-hidden="true"></i>  {{ $misc->emails_list[0]->value }}</li>@endif
                           
                        </ul>
                    </div>                   
                
                    </div>
            </div>
            </div>
            </header>

