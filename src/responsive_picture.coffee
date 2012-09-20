$ = jQuery

class @ResponsivePicture
  constructor: (@$el) ->
    @largestMediaMinWidth = 0
    @newSrc = undefined

    @_replacePictureImgSrcWithBestSourceSrcsetSrc()
    @_onResizeReplacePictureImgSrcWithBestSourceSrcsetSrc()

  _onResizeReplacePictureImgSrcWithBestSourceSrcsetSrc: ->
    $(window).resize @_replacePictureImgSrcWithBestSourceSrcsetSrc

  _replacePictureImgSrcWithBestSourceSrcsetSrc: =>
    @largestMediaMinWidth = 0
    smallestSource = @$el.children("source:not([media])")
    @newSrc = @_getSrcFromSrcset(smallestSource)
    @$el.children("source").each (i, el) =>
      @_keepSrcIfBestMediaMatch(el)
    @_setPictureImgSrc(@$el, @newSrc)

  _keepSrcIfBestMediaMatch: (el) ->
    mediaQuery = $(el).attr("media")
    if mediaQuery && matchMedia(mediaQuery).matches
      mediaQueryMinWidth = @_getMediaQueryMinWidth(mediaQuery)
      if mediaQueryMinWidth >= @largestMediaMinWidth
        @largestMediaMinWidth = mediaQueryMinWidth
        @newSrc = @_getSrcFromSrcset($(el))

  _getMediaQueryMinWidth: (mediaQuery) ->
    parseInt mediaQuery.match(/\d+/)[0]

  _setPictureImgSrc: ($el, value) ->
    $el.children("img").attr "src", value

  _getSrcFromSrcset: ($el) ->
    @_getSrcset($el).match(/^\S+?(?=,|\s)/)[0]

  _getSrcset: ($el) ->
    $el.attr("srcset")

$.fn.responsivePicture = () ->
  this.each ->
    new ResponsivePicture($(this))
