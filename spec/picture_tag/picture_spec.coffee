describe "PictureTag.Picture", ->
  $el = $('
    <picture>
      <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
      <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
      <source srcset="images/small-1.jpg 1x">
      <img src="images/small-1.jpg" alt="">
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
        spyOn(@picture, '_img').andCallThrough()
        spyOn(@picture.sources, 'best')
        @picture._displayBest()

      it "calls _img once", ->
        expect(@picture._img.calls.length).toEqual(1)

      it "calls best on sources once", ->
        expect(@picture.sources.best.calls.length).toEqual(1)

    describe "_img", ->
      it "returns a PictureTag.Img", ->
        expect(@picture._img()).toEqual(jasmine.any(PictureTag.Img))

  describe "event", ->
    describe "window resize", ->
      beforeEach ->
        spyOn(@picture, '_displayBest').andCallThrough()
        spyOn(@picture, '_img').andCallThrough()
        spyOn(@picture.sources, 'best')
        $(window).resize()

      it "calls best on sources once", ->
        expect(@picture.sources.best.calls.length).toEqual(1)

      it "calls display on img once", ->
        expect(@picture._img.calls.length).toEqual(1)
