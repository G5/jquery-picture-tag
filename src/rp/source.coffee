class RP.Source
  constructor: (@$el) ->
    console.log "source constructor"
    console.log @$el

    @media = new RP.Media @$el.attr("media")

  isBetterThan: (other) ->
    @media.isBetterThan other.media

  src: ->
    @_srcset().match(/^\S+/)[0]

  _srcset: ->
    @$el.attr "srcset"
