$ = jQuery

class @ResponsiveImage
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
    if matchMedia(mediaQuery).matches
      mediaQueryMinWidth = @_getMediaQueryMinWidth(mediaQuery)
      if mediaQueryMinWidth >= @largestMediaMinWidth
        @largestMediaMinWidth = mediaQueryMinWidth
        @newSrc = @_getSrcFromSrcset($(el))

  _getMediaQueryMinWidth: (mediaQuery) ->
    mediaQuery.match(/\d+/)

  _setPictureImgSrc: ($el, value) ->
    $el.children("img").attr "src", value

  _getSrcFromSrcset: ($el) ->
    @_getSrcset($el).match(/^\S+/)[0]

  _getSrcset: ($el) ->
    $el.attr("srcset")

$.fn.makeResponsive = () ->
  $pictures = this
  $pictures.each ->
    ri = new ResponsiveImage($(this))
