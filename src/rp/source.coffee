class @RP.Source
  constructor: (@$el) ->
    @media = new RP.Media @$el.attr("media")
    @srcset = @$el.attr "srcset"

  isBetterThan: (other) ->
    thing = @media.isBetterThan other.media
    thing

  src: ->
    @srcset.match(/^\S+/)[0] if @srcset
