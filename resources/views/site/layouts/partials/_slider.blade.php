@if($banner)
<section class="khattab-slider">

    <div id="mycarousel" class="carousel slide" data-ride="carousel">
        
            <div class="carousel-inner">
                @foreach($banner as $k => $slide)
                   <div class="carousel-item @if($k==0) active @endif">
                      <img src="{{ $slide->image->imageFullLink() }}" alt="{{ $slide->title_locale }}">
                    </div>
                    
                    @endforeach
            </div>
                  
             <a class="carousel-control-prev" href="#mycarousel" data-slide="prev">
                      <span class="carousel-control-prev-icon"></span> 
                    </a>
             <a class="carousel-control-next" href="#mycarousel" data-slide="next">
                      <span class="carousel-control-next-icon"></span>
                    </a>
    </div>
       
</section>
@endif
