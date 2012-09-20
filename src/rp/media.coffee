class RP.Media
  constructor: (@attr) ->
    console.log "media constructor"
    console.log @attr

  isBetterThan: (other) ->
    if @matches && !other.matches
      true
    else if @matches && other.matches
      @minWidth <= other.minWidth
    else
      false

  matches: ->
    @attr && mediaMatch(@attr).matches

  minWidth: ->
    parseInt @attr.match(/\d+/)[0]
