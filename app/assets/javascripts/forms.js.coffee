$(document).ready ->

  $('h1').fitText()
  $('h2').fitText(2)
  $('h3').fitText()
  $('.custom-error-message').fitText()
  $('input[type=submit]').fitText()
  $('input[type=text]').fitText(4)

  $(".map").fadeOut

  $("#first form").submit (e) ->
    e.preventDefault()
    if $(this).parsley( 'isValid' )
      $("#first").animate
        left: "-50%"
      , 500, ->
        $("#first").css "display", "none"

      $("#second").animate
        left: "50%"
      , 500

  $("#second form").submit (e) ->
    e.preventDefault()
    if $(this).parsley("validate") 
      $("#second").animate
        left: "-50%"
      , 500, ->
        $("#second").css "display", "none"

      $("#third").animate
        left: "50%"
      , 500
  
  $("#third form").submit (e) ->
    e.preventDefault()
    if $(this).parsley("validate")
      $("#third").animate
        left: "-50%"
      , 500, ->
        $("#third").css "display", "none"
        $(".map").css "left", "50%"
      $(".map").fadeIn