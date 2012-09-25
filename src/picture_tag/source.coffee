class @PictureTag.Source
  constructor: (@$el) ->
    @media = new PictureTag.Media @$el.attr("media")
    @srcset = @$el.attr "srcset"

  isBetterThan: (other) ->
     @media.isBetterThan other.media

  src: ->
    @srcset.match(/^\S+?(?=,|\s)/)[0] if @srcset
