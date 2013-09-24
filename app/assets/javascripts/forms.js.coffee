$(document).ready ->

  $('h1').fitText()
  $('h2').fitText(2)
  $('h3').fitText()
  $('.custom-error-message').fitText()
  $('input[type=submit]').fitText()
  $('input[type=text]').fitText(4)

  $("#first form").bind "ajax:complete", (evt, xhr, status) ->
    if status is 'success'
      $("#to_street_error").fadeOut()
      $("#to_zip_error").fadeOut()
      $("#first").animate
        left: "-50%"
      , 500, ->
        $("#first").css "display", "none"

      $("#second").animate
        left: "50%"
      , 500
    else 
      errors = $.parseJSON(xhr.responseText).errors
      $("#to_street_error").empty()
      $("#to_zip_error").empty()
      if errors.street
        $("#to_street_error").html errors.street
        $("#to_street_error").fadeIn()
      else
        $("#to_street_error").fadeOut()
      if errors.zip_code
        $("#to_zip_error").html errors.zip_code
        $("#to_zip_error").fadeIn()
      else
        $("#to_zip_error").fadeOut()


  $("#second form").bind "ajax:complete", (evt, xhr, status) ->
    if status is 'success'
      $("#from_street_error").fadeOut()
      $("#from_zip_error").fadeOut()
      $("#second").animate
        left: "-50%"
      , 500, ->
        $("#second").css "display", "none"

      $("#third").animate
        left: "50%"
      , 500
    else 
      errors = $.parseJSON(xhr.responseText).errors
      $("#from_street_error").empty()
      $("#from_zip_error").empty()
      if errors.street
        $("#from_street_error").html errors.street
        $("#from_street_error").fadeIn()
      else
        $("#from_street_error").fadeOut()
      if errors.zip_code
        $("#from_zip_error").html errors.zip_code
        $("#from_zip_error").fadeIn()
      else
        $("#from_zip_error").fadeOut()

  $("#third form").bind "ajax:complete", (evt, xhr, status) ->
    if status is 'success'
      $("#from_phone_error").fadeOut()
      $("#third").animate
        left: "-50%"
      , 500, ->
        $("#third").css "display", "none"
        $(".map").css "left", "50%"
        $(".map").fadeIn()
    else 
      errors = $.parseJSON(xhr.responseText).errors
      $("#from_phone_error").html errors.phone_number
      $("#from_phone_error").fadeIn()