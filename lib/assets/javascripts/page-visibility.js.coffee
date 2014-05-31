window.Soleone ?= {}

class Soleone.PageVisibility
  @isVisible: ->
    return !document.webkitHidden if "webkitHidden" of document
    return !document.mozHidden if "mozHidden" of document
    return !document.hidden if "hidden" of document
    # worst case return true
    return true