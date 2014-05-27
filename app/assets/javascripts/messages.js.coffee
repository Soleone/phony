# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $("#message_to").val() == ""
    $("#message_to").focus()
  else
    $("#message_body").focus()

  $("#message_body").on "keyup", ->
    remaining = 160 - $("#message_body").val().length
    $(".character-count").html(remaining)

    if remaining < 0
      $(".character-count-status").addClass("warning")
    else
      $(".character-count-status").removeClass("warning")