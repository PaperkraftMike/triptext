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

var geocoder = new google.maps.Geocoder();
  geocoder.geocode({address: 'Jax Beach, FL'}, function(results, status) {
      var bounds = results[0].geometry.bounds,
          center = results[0].geometry.location;
      if (bounds) {
          var ne = bounds.getNorthEast(),
              sw = bounds.getSouthWest(),
              data = { sw: [sw.lat(), sw.lng()], ne: [ne.lat(), ne.lng()]};

              // ajax call to rails service API
      }
  });

var opts = {
    zoom: 10,
    max_zoom: 16,
    scrollwheel: false,
    center: new google.maps.LatLng(center.lat(), center.lng()),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    MapTypeControlOptions: {
        MapTypeIds: [google.maps.MapTypeId.ROADMAP]
        }
    };

var map = new google.maps.Map($('#map'), opts);