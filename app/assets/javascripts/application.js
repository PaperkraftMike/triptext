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
var map;
var geocoder_one_results;


$(document).ready(function() {

var infowindow = new google.maps.InfoWindow(
  { 
    size: new google.maps.Size(150,50)
  });



function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var mapOptions = {
    zoom: 7,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: new google.maps.LatLng(40.6700, -73.9400)
  };
  map = new google.maps.Map(document.getElementById('map_canvas'),
      mapOptions);
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directions-panel'));

  var control = document.getElementById('control');
  //control.style.display = 'block';
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
}

function calcRoute(start, end) {
  var request = {
      origin:start,
      destination:end,
      travelMode: google.maps.DirectionsTravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      console.log($(".drive_time").val(response.routes[0].legs[0].duration));
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


function getLatLong_destination(address, callback){
      var geo = new google.maps.Geocoder;
      geo.geocode({'address':address},function(results, status){
              if (status == google.maps.GeocoderStatus.OK) {
                callback(results, "Destination Pin", "Destination")
              } else {
                alert("Geocode was not successful for the following reason: " + status);
              }
       });
  }


function getLatLong_current(address, callback){
      var geo = new google.maps.Geocoder;
      geo.geocode({'address':address},function(results, status){
              if (status == google.maps.GeocoderStatus.OK) {
                callback(results, "Current Location Pin", "Current Location")
              } else {
                alert("Geocode was not successful for the following reason: " + status);
              }
       });
  }




$(".destination").submit(function(){
  d_street = $(".destination_street input[type='text']").val();
  d_zip_code = $(".destination_zip_code input[type='text']").val();
  full_destination = d_street + d_zip_code
  getLatLong_destination(full_destination, function(geocoder_one_results, pin_caption, pin_caption_two){createMarker(geocoder_one_results, pin_caption, pin_caption_two)})
});

$(".current_location").submit(function(){
  c_street = $(".current_street input[type='text']").val();
  c_zip_code = $(".current_zip_code input[type='text']").val();
  full_current_location = c_street + ", " + c_zip_code
  getLatLong_current(full_current_location, function(geocoder_one_results, pin_caption, pin_caption_two){createMarker(geocoder_one_results, pin_caption, pin_caption_two)})
  calcRoute(full_current_location, full_destination);
});

google.maps.event.addDomListener(window, 'load', initialize);

$('.submit-destination').click(function() {

    $('#first').animate({
        left: '-50%'
    }, 500, function() {
        $('#first').css('display', 'none');
    });

    $('#second').animate({
        left: '50%'
    }, 500);
});

$('.submit-address').click(function() {

    $('#second').animate({
        left: '-50%'
    }, 500, function() {
        $('#second').css('display', 'none');
    });

    $('#third').animate({
        left: '50%'
    }, 500);
});

$('.submit-message').click(function() {

    $('#third').animate({
        left: '-50%'
    }, 500, function() {
        $('#third').css('display', 'none');
        $('.map').css('left', '50%');
    });

    $('.map').animate({
        opacity: 1
    }, 500);
});

});