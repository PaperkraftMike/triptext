is_int = (value) ->
  if (parseFloat(value) is parseInt(value)) and not isNaN(value)
    true
  else
    false

$(document).ready ->

  $(".zip").on "keyup", ->
    el = $(this)
    if (el.val().length is 5) and (is_int(el.val()))
      $.ajax
        url: "http://zip.elevenbasetwo.com"
        cache: false
        dataType: "json"
        type: "GET"
        data: "zip=" + el.val()
        success: (result, success) ->
          $(".city").text result.city
          $(".state").text result.state

        error: (result, success) ->
          $(".city").text "CITY"
          $(".state").text "STATE"  
    else
        $(".city").text "CITY"
        $(".state").text "STATE"               


  jQuery.hook 'addClass'

  $('.form-control').bind "onafteraddClass", (e) ->
    popup = $("form label[for='" + $(this).attr('id') + "']")
    if $(this).hasClass('parsley-error')
      popup.addClass "error"
      $('.panel').addClass "error"
      popContent = $(this).next().text()
      popup.popover content: popContent
      popup.popover "show"
    else
      popup.removeClass "error"
      popup.popover "destroy"

  $('.destination').on "submit", ->
    if $(this).parsley('validate')
      $('.panel').removeClass "error"
      window.destination = $('.destination .address').val() + ',' + $('.destination .zip').val()
      $('#destination').animate
        left: "-50%"
      , 800

      $('#origin').animate
        left: "50%"
      , 800


  $('.origin').on "submit", ->
    if $(this).parsley('validate')
      window.origin = $('.origin .address').val() + ',' + $('.origin .zip').val()
      $.getJSON( "http://maps.googleapis.com/maps/api/directions/json?origin=#{window.origin}&destination=#{window.destination}&sensor=false", (data) ->
        $('.drive_time').val data.routes[0].legs[0].duration.value
      )
      $('#origin').animate
        left: "-50%"
      , 800

      $('#message').animate
        left: "50%"
      , 800
      $("#dialog-message").append("<div>Start: #{window.origin}</div>")
      $("#dialog-message").append("<div>End: #{window.destination}</div>")

  $("#dialog-message").dialog autoOpen: false, modal: true , buttons: 
    Ok: ->
      $(this).dialog window.location.href = "/"

    "Like us? Register for more features": ->
      $(this).dialog window.location.href = "/users/new"

  $('.message').on "submit", ->
    if $(this).parsley('validate')
      $("#dialog-message").dialog("open")

