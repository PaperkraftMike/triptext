$(document).ready ->

  $(".submit-destination").click ->
    $("#first").animate
      left: "-50%"
    , 500, ->
      $("#first").css "display", "none"

    $("#second").animate
      left: "50%"
    , 500

  $(".submit-address").click ->
    $("#second").animate
      left: "-50%"
    , 500, ->
      $("#second").css "display", "none"

    $("#third").animate
      left: "50%"
    , 500

  $(".submit-message").click ->
    $("#third").animate
      left: "-50%"
    , 500, ->
      $("#third").css "display", "none"
      $(".map").css "left", "50%"

    $(".map").animate
      opacity: 1
    , 500