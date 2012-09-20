class @RP.Picture
  constructor: (@$el) ->
    @sources = new RP.Sources(@$el.children "source")
    @img = new RP.Img(@$el.children("img:first"))

    @_imgReplaceWithSourcesBest
    $(window).resize @_imgReplaceWithSourcesBest

  _imgReplaceWithSourcesBest: ->
    @img.replaceWith @sources.best()
