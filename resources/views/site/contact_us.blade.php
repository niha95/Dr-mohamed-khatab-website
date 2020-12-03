@extends('site.layouts.default')

@section('content')


    <section class="page-content">
        <div class="container contact-us">
            <div class="row">
                <div class="col-sm-6">
                    <h3>{!! trans('labels.address') !!}</h3>
                  
                    <p><i class="fa fa-map-marker" aria-hidden="true"></i><span> {{ $misc->address_locale }}</span></p>
                    @if($misc->phone_numbers_list)
                      
                    <h3>{!! trans('labels.phone_numbers') !!}</h3>
                     
                      @foreach($misc->phone_numbers_list as $phone)
                    <p><i class="fa fa-phone" aria-hidden="true"></i><span>
                            {{ $phone->value }} 
                           </span></p> @endforeach
                        @endif
                         @if($misc->emails_list)
                        @foreach($misc->emails_list as $email)
                    <h3>{!! trans('labels.email_address') !!} 
                   </h3>
                    <p><i class="fa fa-envelope" aria-hidden="true"></i><span>
                            {{ $email->value }}
                           </span></p> @endforeach
                        @endif
                    </div>
        <div class="col-sm-6">
                        <h3>Contuct us<h3>
                       
                        <p>{!! trans('messages.contact_massage') !!}</p>
                          <form action="{{ route('site.send_contact_message') }}" id="main-contact-form" method="post" name="contact-form" class="contact-form">
                            @include('site.common._errors')
                            @include('site.common._flash_message')
                            {!! csrf_field() !!}
                            <div class="form-group">
                                <input type="text" name="sender_name" class="form-control" id="SenderName" placeholder="{!! trans('labels.username') !!} *" required>
                            </div>
                            <div class="form-group">
                                <input type="email" name="sender_email_address" class="form-control" id="SenderEmailAddress" placeholder=" {!! trans('labels.email_address') !!} *" required >
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="sender_phone_number" class="form-control" id="SenderPhoneNumber" placeholder="{!! trans('labels.phone_numbers') !!} ">
                            </div>
                            <div class="form-group">
                                <textarea rows="10" class="form-control" placeholder="{!! trans('labels.visitors_messages') !!}" name="message" required></textarea>
                            </div>
                            <input type="hidden" name="subject" class="form-control" id="Subject" value="{{trans('labels.contact_us')}}">
                            <button class="btn" type="submit">{{ trans('actions.send') }}</button>
                            <button class="btn" type="reset">{{ trans('actions.reset') }}</button>
                        </form>
                    </div>
            </div>
        </div>
        <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3456.286655100036!2d31.14362991449962!3d29.971190828985616!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14584f6057adc05b%3A0x75d402bfa9ca265a!2sVadecom!5e0!3m2!1sen!2seg!4v1522249393501" width="100%" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
    </section>
@append

<?php /*
@section('js')
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnGAU6SVZCI3bq0csAXS60jTAQU1XZdl4"></script>
    <script src="{{ asset('assets/site/js/jquery.gmap/jquery.gmap.min.js') }}"></script>
    <script src="{{ asset('assets/site/js/map.js') }}"></script>
@append
 */ ?>