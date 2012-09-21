class @RP.Picture
  constructor: (@$el) ->
    @sources = new RP.Sources(@$el.children "source")
    @img = new RP.Img(@$el.children("img:first"))

    @_displayBestSrc()
    $(window).resize @_displayBestSrc

  _displayBestSrc: ->
    console.log @img
    console.log @sources
    @img.display @sources.best() if @img and @sources
