class RP.Sources
  constructor: (@$els) ->
    @defaultSource = new RP.Source @$els.find(":not([media])")
    @mediaSources = @$els.map @_newSource
    
  best: =>
    bestSoFar = @defaultSource
    @mediaSources.each (i, mediaSource) =>
      if mediaSource.isBetterThan bestSoFar
        bestSoFar = mediaSource
    bestSoFar.src()

  _newSource: (i, el) =>
    new RP.Source($(el))
