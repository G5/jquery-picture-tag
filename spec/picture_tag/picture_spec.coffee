describe "PictureTag.Picture", ->
  $el = $('
    <picture alt="Kitty cat!">
      <source media="(min-width: 1600px)" srcset="cat-huge.jpg 1x,   cat-huge@2x.jpg 2x">
      <source media="(min-width: 1000px)" srcset="cat-large.jpg 1x,  cat-large@2x.jpg 2x">
      <source media="(min-width: 768px)"  srcset="cat-medium.jpg 1x, cat-medium@2x.jpg 2x">
      <source media="(min-width: 480px)"  srcset="cat-small.jpg 1x,  cat-small@2x.jpg 2x">
      <source                             srcset="cat-tiny.jpg 1x,   cat-tiny@2x.jpg 2x">
      <img alt="Kitty cat!"               src="cat-tiny.jpg">
    </picture>
  ')

  beforeEach ->
    @picture = new PictureTag.Picture($el)

  describe "attribute", ->

    describe "sources", ->
      it "is of type PictureTag.Sources", ->
        expect(@picture.sources).toEqual(jasmine.any(PictureTag.Sources))

  describe "method", ->

    # TODO: how to spyOn method call in constructor?
    xdescribe "constructor", ->
      beforeEach ->
        spyOn(@picture, '_displayBest')
      it "calls _displayBest once", ->
        expect(@picture._displayBest).toEqual(1)

    describe "_displayBest", ->
      beforeEach ->
        spyOn(@picture, '_displayBest').andCallThrough()
        spyOn(@picture.pictureImg, 'display')
        spyOn(@picture.sources, 'best')
        @picture._displayBest()

      it "calls best on sources once", ->
        expect(@picture.sources.best.calls.length).toEqual(1)

      it "calls display on pictureImg once", ->
        expect(@picture.pictureImg.display.calls.length).toEqual(1)

  describe "event", ->
    describe "window resize", ->
      beforeEach ->
        spyOn(@picture, '_displayBest').andCallThrough()
        spyOn(@picture.pictureImg, 'display')
        spyOn(@picture.sources, 'best')
        $(window).resize()

      it "calls best on sources once", ->
        expect(@picture.sources.best.calls.length).toEqual(1)

      it "calls display on pictureImg once", ->
        expect(@picture.pictureImg.display.calls.length).toEqual(1)
