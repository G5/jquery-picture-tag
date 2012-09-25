class @PictureTag.Picture
  constructor: (@$el) ->
    @sources = new PictureTag.Sources(@$el.children "source")
    @img = new PictureTag.Img(@$el.children("img:first"))

    @_displayBest()
    $(window).resize @_displayBest

  _displayBest: =>
    @img.display @sources.best()
