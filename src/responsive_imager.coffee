$ = jQuery

class @ResponsiveImage
  constructor: (@$el) ->
    @highestMatch = 0
    @mediaSource = undefined
    @mediaQuery = undefined
    @screenWidth = 0

    @_doSomething()
    @_initBehavior()

  _initBehavior: ->
    $(window).resize @_doSomething

  _doSomething: =>
    @highestMatch = 0
    @mediaSource = @_getSrc(@$el.children("source:not([media])"))
    # iterate through sources
    @$el.children("source").each (i, el) =>
      @mediaQuery = $(el).attr("media")
      # if source media query matches
      if matchMedia(@mediaQuery).matches
        @screenWidth = @mediaQuery.match(/\d+/)
        # see if its the best match
        if @screenWidth >= @highestMatch
          @highestMatch = @screenWidth
          @mediaSource = @_getSrc($(el))
          console.log @mediaSource
    # swap out the src
    console.log @mediaSource
    @$el.children("img").attr "src", @mediaSource

  _getSrc: ($el) ->
    $el.attr("srcset").match(/^\S+/)[0]

$.fn.makeResponsive = () ->
  $pictures = this
  $pictures.each ->
    ri = new ResponsiveImage($(this))
