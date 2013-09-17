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
//= require parallax.min.js

var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map
var geocoder_one_results

$(document).ready(function() {

//  parallax.add($("#first"))
//    .add($("#second"))
//  .add($("#third"));

//  parallax.first.onload=function(){
//    setRight("second", "Second");
//  };

//  parallax.second.onload=function(){
//    setRight("third", "Third");
//  };

//$(".submit-destination").onclick(parallax.second.left());

var infowindow = new google.maps.InfoWindow(
  { 
    size: new google.maps.Size(150,50)
  });


function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var mapOptions = {
    zoom: 7,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: new google.maps.LatLng(41.850033, -87.6500523)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directions-panel'));

  var control = document.getElementById('control');
  //control.style.display = 'block';
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
}

function calcRoute() {
  var start = full_current_location
  var end = full_destination
  var request = {
      origin:start,
      destination:end,
      travelMode: google.maps.DirectionsTravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

function createMarker(latlng, name, html) {
    latlng = latlng[0].geometry.location
    var contentString = html;
    var marker = new google.maps.Marker({
        position: latlng,
        map: map,
        zIndex: Math.round(latlng.lat()*-100000)<<5
        });

    google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(contentString); 
        infowindow.open(map,marker);
        });
    google.maps.event.trigger(marker, 'click');    
    return marker;
}

function getLatLong(address, callback){
      var geo = new google.maps.Geocoder;
      geo.geocode({'address':address,},function(results, status){
              if (status == google.maps.GeocoderStatus.OK) {
                callback(results, "my pin", "a great pin")
              } else {
                alert("Geocode was not successful for the following reason: " + status);
              }
       });
  }




$(".destination").submit(function(){
  d_street = $(".destination_street input[type='text']");
  console.log(d_street)
  d_zip_code = $(".destination_zip_code input[type='text']");
  console.log(d_zip_code)
  full_destination = d_street + "+" + d_zip_code
  console.log(full_destination)
  getLatLong(full_destination, function(geocoder_one_results, pin_caption, pin_caption_two){createMarker(geocoder_one_results, pin_caption, pin_caption_two)})
});

$(".current_location").submit(function(){
  c_street = $(".current_street input[type='text']");
  c_zip_code = $(".current_zip_code input[type='text']");
  full_current_location = c_street + ", " + c_zip_code
  getLatLong(full_current_location, function(geocoder_one_results, pin_caption, pin_caption_two){createMarker(geocoder_one_results, pin_caption, pin_caption_two)})
});


google.maps.event.addDomListener(window, 'load', initialize);

// $('form').submit(function() {  
//     var valuesToSubmit = $(this).serialize();
//     $.ajax({
//         url: $(this).attr('action'), //sumbits it to the given url of the form
//         data: valuesToSubmit,
//         dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
//     }).success(function(json){

//     });
//     return false; // prevents normal behaviour
// });

});



