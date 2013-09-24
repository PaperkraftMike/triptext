$(document).ready ->

  $('h1').fitText()
  $('h2').fitText(2)
  $('h3').fitText()
  $('.custom-error-message').fitText()
  $('input[type=submit]').fitText()
  $('input[type=text]').fitText(4)

  $("#first form").bind "ajax:complete", (evt, xhr, status) ->
    if status is 'success'
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
      if errors.zip_code
        $("#to_zip_error").html errors.zip_code


  $("#second form").bind "ajax:complete", (evt, xhr, status) ->
    if status is 'success'
      $("#second").animate
        left: "-50%"
      , 500, ->
        $("#second").css "display", "none"

      $("#third").animate
        left: "50%"
      , 500
    else 
      errors = $.parseJSON(xhr.responseText).errors
      $("#from_street_error").html errors.street
      $("#from_zip_error").html errors.zip_code

  $("#third form").bind "ajax:complete", (evt, xhr, status) ->
    console.log(status)
    if status is 'success'
      $("#third").animate
        left: "-50%"
      , 500, ->
        $("#third").css "display", "none"
        $(".map").css "left", "50%"
        $(".map").fadeIn
    else 
      errors = $.parseJSON(xhr.responseText).errors
      $("#from_phone_error").html errors.phone_number