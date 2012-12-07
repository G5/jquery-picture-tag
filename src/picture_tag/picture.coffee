class @PictureTag.Picture
  constructor: (@$el) ->
    @$fallbackImg = @$el.children "img:first"
    @$fallbackImg.hide()

    @pictureImg = new PictureTag.Img this

    @sources = new PictureTag.Sources(@$el.children "source")

    @_displayBest()
    $(window).resize @_displayBest

  _displayBest: =>
    @pictureImg.display @sources.best()
