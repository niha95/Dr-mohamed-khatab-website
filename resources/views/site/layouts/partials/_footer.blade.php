
<section class="bottom-section">
            <div class="container">
                <div class="row">
                     <div class="col-md-8 contact-form">
                        <form action="{{ route('site.send_contact_message') }}" id="main-contact-form" method="post" name="contact-form" class="contact-form">
                            @include('site.common._errors')
                            @include('site.common._flash_message')
                            {!! csrf_field() !!}
                            <div class="form-group">
                                <input class="form-control" name="sender_name" type="text" placeholder="الاسم">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="sender_email_address" type="email" placeholder="البريد الإلكترونى">
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="subject" class="form-control" id="Subject" value="{{trans('labels.contact_us')}}">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" rows="5" placeholder="الرسالة"></textarea>
                            </div>
                            <button class="btn" type="submit"> <i class="fa fa-long-arrow-right" aria-hidden="true"></i> ارسال</button>
                        </form>
                    </div>
                    <div class="col-md-4">
                        <div class="row contact-data">
                            
                            <div class="col-md-4">
                                <img class="img-fluid" src="{{ asset('assets/site/images/callcenter-man.png') }}">
                            </div>
                            <div class="col-md-8">
                                <div class="">
                                <h2> معلومات الإتصال</h2>
                                <p>MOHAMED KHATTAB</p>
                                <p><span>العنوان: </span>                                  
                                    2 off rd. 9، معادي الخبيري الغربية، المعادي، محافظة القاهرة‬
                                </p>
                                 @if($misc->phone_numbers_list)
                        @foreach($misc->phone_numbers_list as $phone)
                           <p><span>الهاتف: </span>: 
                                 {{ $phone->value }}
                           </p>
                        @endforeach
                    @endif
                                
                            @if($misc->emails_list)
                        @foreach($misc->emails_list as $email)
                            <p><span>الايميل:</span>
                                 :{{ $email->value }}</p>
                        @endforeach
                    @endif
                               
                                </div>
                                 <ul class="list-unstyled list-inline social">
                                    <li class="list-inline-item"><a href=""><i class="fa fa-snapchat-ghost" aria-hidden="true"></i></a></li>
                                    <li class="list-inline-item"><a href=""><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>

                                    <li class="list-inline-item"><a href=""><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li class="list-inline-item"><a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a></li>

                                    <li class="list-inline-item"><a href=""><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                    <li class="list-inline-item"><a href=""><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        
                    </div>
                   
                </div>
                
                <div class="row">
                    
                    <div class="col-md-8">
                        <footer class="text-center">
                            <span>جميع الحقوق محفوظه &reg; 2018 د.محمد خطاب 
                                <br>
                                <a href="https://vadecom.net/ar" target="_blank"> تصميم مواقع</a> - 
                                <a href="https://vadecom.net/ar" target="_blank"> شركة فاديكوم</a>
                            </span>
                        </footer>
                    </div>
                </div>
            </div>
        </section>

