class @PictureTag.Img
  constructor: (@picture) ->
    @alt = @picture.$el.attr("alt")
    @$el = $('<img alt="'+@alt+'" src="">')
    @picture.$el.children("img:last").after(@$el)

  display: (value) =>
    @$el = @_current()
    unless value == @$el.attr("src")
      @$el2 = @$el.clone()
      @$el2.attr "src", value
      @$el2.load @_replace

  _current: =>
    @picture.$el.children("img:last")
  
  _replace: =>
    @$el.replaceWith @$el2
