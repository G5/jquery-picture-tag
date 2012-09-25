class @PictureTag.Sources
  constructor: (@$els) ->
    @defaultSource = new PictureTag.Source @$els.filter(":not([media])")
    @mediaSources = @$els.filter("[media]").map @_newSource
    
  best: =>
    bestSoFar = @defaultSource
    @mediaSources.each (i, mediaSource) =>
      if mediaSource.isBetterThan bestSoFar
        bestSoFar = mediaSource
    bestSoFar.src()

  _newSource: (i, el) =>
    new PictureTag.Source($(el))
