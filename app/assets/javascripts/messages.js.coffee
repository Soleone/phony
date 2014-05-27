# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#message_body").on "keyup", ->
    remaining = 160 - $("#message_body").val().length
    $(".character-count").html(remaining)

    if remaining < 0
      $(".character-count-status").addClass("warning")
    else
      $(".character-count-status").removeClass("warning")