class @PictureTag.Img
  constructor: (@$el) ->

  display: (value) ->
    @$el.attr "src", value
