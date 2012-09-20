class RP.Img
  constructor: (@$el) ->
    console.log "img constructor"
    console.log @$el

  replaceWith: (value) ->
    @$el.attr "src", value
