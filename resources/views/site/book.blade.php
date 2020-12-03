@extends('site.layouts.default')

@section('content')

<section class="page-content">
            <div class="container">
              <div class="booking-form col-md-8 offset-md-2">
                    <form>
                        <div class="form-group">
                            <label>Name</label>
                            <input class="form-control" type="text"/>
                        </div>
                        <div class="form-group">
                            <label>e-mail</label>
                            <input class="form-control" type="email"/>
                        </div>
                        <div class="form-group">
                            <label>telephone</label>
                            <input class="form-control" type="text"/>
                        </div>
                        <div class="form-group">
                            <label>date of arrival</label>
                            <input class="form-control datepicker date" type="text"/>
                        </div>
                        <div class="form-group">
                            <label>Date of Departure</label>
                            <input class="form-control datepicker date" type="text"/>
                        </div> 
                       <div class="form-group">
                            <label>pickup address </label>
                            <textarea class="form-control" rows="2"></textarea>
                        </div>
                         <div class="form-group">
                            <label>Destination Address </label>
                            <textarea class="form-control" rows="2"></textarea>
                        </div>
                        <div class="form-group">
                           <label>Journey Type </label>
                           <select class="form-control">
                             <option>one way</option>
                             <option>return</option>
                           </select>
                         </div>
                         <div class="form-group">
                            <label>no.of passengers</label>
                            <input class="form-control " type="number" value="1"/>
                        </div> 
                        <div class="form-group">
                            <label>additional message</label>
                            <textarea class="form-control" rows="5"></textarea>
                        </div>
                        <button class="btn" type="submit">send request</button>
                    </form>
                </div>
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