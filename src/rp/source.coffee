class @RP.Source
  constructor: (@$el) ->
    @media = new RP.Media @$el.attr("media")
    @srcset = @$el.attr "srcset"

  isBetterThan: (other) ->
     @media.isBetterThan other.media

  src: ->
    @srcset.match(/^\S+/)[0] if @srcset
