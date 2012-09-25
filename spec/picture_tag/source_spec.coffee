describe "PictureTag.Source", ->
  $el = $('
    <picture>
      <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
      <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
      <source srcset="images/small-1.jpg 1x">
      <img src="images/small-1.jpg" alt="">
    </picture>
  ')

  beforeEach ->
    @source = new PictureTag.Source($el.children "source:first")

  describe "attribute", ->

    describe "media", ->
      it "is of type PictureTag.Source", ->
        expect(@source.media).toEqual(jasmine.any(PictureTag.Media))

    describe "srcset", ->
      it "is of type String", ->
        expect(@source.srcset).toEqual(jasmine.any(String))

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
