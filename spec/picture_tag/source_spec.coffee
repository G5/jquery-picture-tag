describe "PictureTag.Source", ->
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
