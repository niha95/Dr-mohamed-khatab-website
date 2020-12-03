<section class="navigationbar" id="navbar">
            <div class="container">
                <nav class="navbar navbar-expand-md navbar-light sticky-top" >
                  <a class="navbar-brand" href="{{route('site.home')}}"><img class="img-fluid" src="{{ asset('assets/site/images/logo.png') }}"></a>

                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="collapsibleNavbar">
                       <ul class="nav navbar-nav">
                                @foreach($navbar as $item)
                                  <li class="nav-item"><a href="{{ $item->fullUrl() }}" class="nav-link ">{{ $item->title_locale }}
                                      
                                      </a></li>
                                @endforeach
                              </ul>
                        
                  </div> 
                </nav>
            </div>
        </section>