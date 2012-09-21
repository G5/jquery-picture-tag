describe "RP.Source", ->
  $el = $('
    <picture>
      <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
      <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
      <source srcset="images/small-1.jpg 1x">
      <img src="images/small-1.jpg" alt="">
    </picture>
  ')

  beforeEach ->
    @source = new RP.Source($el.children "source:first")

  describe "attribute", ->

    describe "media", ->
      it "is defined", ->
        expect(@source.media).toBeDefined
      it "is of type RP.Source", ->
        expect(@source.media).toEqual(jasmine.any(RP.Media))

  describe "method", ->

    describe "isBetterThan", ->
      beforeEach ->
        spyOn(@source.media, 'isBetterThan')
        @source.media.isBetterThan()
      it "calls isBetterThan on media once", ->
        expect(@source.media.isBetterThan.calls.length).toEqual(1)

    describe "src", ->
      it "returns a String", ->
        expect(@source.src()).toEqual(jasmine.any(String))

    describe "_srcset", ->
      it "returns a String", ->
        expect(@source._srcset()).toEqual(jasmine.any(String))
