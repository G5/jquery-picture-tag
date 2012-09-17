$ = jQuery

class @ResponsiveImage
  constructor: (@$el) ->
    @highestMatch = 0
    @newSrc = undefined
    @mediaQuery = undefined
    @screenWidth = 0

    @_doSomething()
    @_initBehavior()

  _initBehavior: ->
    $(window).resize @_doSomething

  _doSomething: =>
    @highestMatch = 0
    @smallestSource = @$el.children("source:not([media])")
    @newSrc = @_getSrcFromSrcset(@smallestSource)
    # iterate through sources
    @$el.children("source").each (i, el) =>
      @mediaQuery = $(el).attr("media")
      @_something(el)
    @_setPictureImgSrc(@$el, @newSrc)

  _something: (el) ->
    # if source media query matches
    if matchMedia(@mediaQuery).matches
      @screenWidth = @mediaQuery.match(/\d+/)
      # see if its the best match
      if @screenWidth >= @highestMatch
        @highestMatch = @screenWidth
        @newSrc = @_getSrcFromSrcset($(el))
        console.log @newSrc
  
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
