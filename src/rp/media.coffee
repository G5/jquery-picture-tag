class RP.Media
  constructor: (@query) ->

  isBetterThan: (other) ->
    if @matches && !other.matches
      true
    else if @matches && other.matches
      @minWidth <= other.minWidth
    else
      false

  _matches: ->
    @query && mediaMatch(@query).matches

  _minWidth: ->
    parseInt @query.match(/\d+/)[0]
