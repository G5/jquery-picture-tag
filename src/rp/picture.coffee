class @RP.Picture
  constructor: (@$el) ->
    @sources = new RP.Sources(@$el.children "source")
    @img = new RP.Img(@$el.children("img:first"))

    @_displayBest()
    $(window).resize @_displayBest

  _displayBest: =>
    @img.display @sources.best()
