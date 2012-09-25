class @PictureTag.Picture
  constructor: (@$el) ->
    @sources = new PictureTag.Sources(@$el.children "source")

    @_displayBest()
    $(window).resize @_displayBest

  _displayBest: =>
    @_img().display @sources.best()

  _img: =>
    new PictureTag.Img(@$el.children("img:first"))
