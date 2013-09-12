// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var geocoder;

function initialize() {
  geocoder = new google.maps.Geocoder();
  directionsDisplay = new google.maps.DirectionsRenderer();
  var mapOptions = {
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: new google.maps.LatLng(40.6700, -73.9400)
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directions-panel'));

  var control = document.getElementById('control');
  control.style.display = 'block';
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
}

function codeAddress() {
  var sAddress = document.getElementById(".current_location_street").value;
  geocoder.geocode( {'address': sAddress}, function(results, status){
    if (status == google.maps.GeocoderStatus.OK){
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location
      });
     } else {
      alert("Geocode was not successful" + status);
     }
  });
}

$(".destination").submit(function(){
  var d_street = $(".destination_street").val();
  var d_city = $(".destination_city").val();
  var d_zip_code = $(".destination_zip_code").val();
  var d_state = $(".destination_state").val();
  return false;
});

function calcRoute() {
  var start = $(".current_location").val();
  var end = document.getElementById(".destination").value;
  var request = {
    origin: start,
    destination: end,
    travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

$('form').submit(function() {  
    var valuesToSubmit = $(this).serialize();
    $.ajax({
        url: $(this).attr('action'), //sumbits it to the given url of the form
        data: valuesToSubmit,
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){

    });
    return false; // prevents normal behaviour
});

$(document).ready(function(){
  var c_street = $(".current_location_street").val();
  var c_zip_code = $(".current_location_zip_code").val();
  var c_city = $(".current_location_city").val();
  var c_state = $(".current_location_state").val();
  var current_location = c_state + c_zip_code + c_city + c_state
});

$(".destination_street").keyup(function(){
  var street = $(this).val();
});












