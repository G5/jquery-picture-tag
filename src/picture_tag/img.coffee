class @PictureTag.Img
  constructor: (@$el) ->

  display: (value) ->
    unless value == @$el.attr("src")
      @$el2 = @$el.clone()
      @$el2.attr "src", value
      @$el2.load @_replace

  _replace: =>
    @$el.replaceWith @$el2
