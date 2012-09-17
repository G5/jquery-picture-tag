$ = jQuery

class @ResponsiveImage
  constructor: (@$el) ->
    @highestMatch = 0
    @mediaSource = undefined
    @mediaQuery = undefined
    @screenWidth = 0

  doSomething: ->
    @highestMatch = 0
    @mediaSource = @$el.children("source:not([media])").attr("srcset").match(/^\S+/)[0]
    # iterate through sources
    @$el.children("source").each (i, el) =>
      @mediaQuery = $(el).attr("media")
      # if source media query matches
      if matchMedia(@mediaQuery).matches
        @screenWidth = @mediaQuery.match(/\d+/)
        # see if its the best match
        if @screenWidth >= @highestMatch
          @highestMatch = @screenWidth
          @mediaSource = $(el).attr("srcset").match(/^\S+/)[0]
          console.log @mediaSource
    # swap out the src
    console.log @mediaSource
    @$el.children("img").attr "src", @mediaSource
      

$.fn.makeResponsive = () ->
  $pictures = this
  $pictures.each ->
    ri = new ResponsiveImage($(this))
    ri.doSomething()
