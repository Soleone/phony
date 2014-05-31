# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.Phony ?= {}

window.Phony.Favicon = new Favico(animation: 'slide')
  
class Phony.MessageNotifier
  @updateLastSeenSid: ->
    lastSeenSid = $($(".message")[0]).data("sid")
    $.cookie('lastSeenSid', lastSeenSid)

  @showNewMessageCount: =>
    if !!@lastSeenSid()
      newMessageCount = $("[data-sid=#{@lastSeenSid()}]").index() - 1
      if newMessageCount > 0
        Phony.Favicon.badge(newMessageCount)
        
  @lastSeenSid: ->
    $.cookie('lastSeenSid')


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

  $(document).on "idle.idleTimer", ->
    window.location.reload()