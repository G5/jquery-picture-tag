$ = jQuery

class @ResponsiveImage
  constructor: (@name) ->

  doSomething: ->
    console.log "something"

$.fn.makeResponsive = () ->
  ri = new ResponsiveImage()
  ri.doSomething()
