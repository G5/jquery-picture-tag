class @PictureTag.Media
  constructor: (@query) ->

  isBetterThan: (other) ->
    if @_matches() && !other._matches()
      true
    else if @_matches() && other._matches()
      @_minWidth >= other.minWidth
    else
      false

  _matches: ->
    @query && matchMedia(@query).matches

  _minWidth: ->
    parseInt @query.match(/\d+/)[0]
