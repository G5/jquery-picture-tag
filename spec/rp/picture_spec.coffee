describe "RP.Picture", ->
  $el = $('
    <picture>
      <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
      <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
      <source srcset="images/small-1.jpg 1x">
      <img src="images/small-1.jpg" alt="">
    </picture>
  ')

  beforeEach ->
    @picture = new RP.Picture($el)

  describe "attribute", ->

    describe "sources", ->
      it "is defined", ->
        expect(@picture.sources).toBeDefined
      it "is of type RP.Sources", ->
        expect(@picture.sources).toEqual(jasmine.any(RP.Sources))

    describe "img", ->
      it "is defined", ->
        expect(@picture.img).toBeDefined
      it "is of type RP.Img", ->
        expect(@picture.img).toEqual(jasmine.any(RP.Img))

  describe "method", ->

    # TODO: how to spyOn method call in constructor?
    xdescribe "constructor", ->
      beforeEach ->
        spyOn(@picture, '_displayBestSrc')
      it "calls _displayBestSrc once", ->
        expect(@picture._displayBestSrc).toEqual(1)

    describe "_displayBestSrc", ->
      beforeEach ->
        spyOn(@picture, '_displayBestSrc').andCallThrough()
        spyOn(@picture.sources, 'best')
        spyOn(@picture.img, 'display')
        @picture._displayBestSrc()

      it "calls best on sources once", ->
        expect(@picture.sources.best.calls.length).toEqual(1)

      it "calls display on img once", ->
        expect(@picture.img.display.calls.length).toEqual(1)

  describe "event", ->
    describe "window resize", ->
      beforeEach ->
        $(window).resize()

      it "calls _displayBestSrc once", ->
        expect(@picture._displayBestSrc).toEqual(1)
