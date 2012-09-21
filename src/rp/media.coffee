class @RP.Media
  constructor: (@query) ->

  isBetterThan: (other) ->
    console.log @query
    if @_matches() && !other._matches()
      console.log "self matches"
      true
    else if @_matches() && other._matches()
      console.log "size comparison"
      @_minWidth >= other.minWidth
    else
      console.log "self doesn't match"
      false

  _matches: ->
    @query && matchMedia(@query).matches

  _minWidth: ->
    parseInt @query.match(/\d+/)[0]
