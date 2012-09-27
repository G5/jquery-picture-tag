describe "PictureTag.Sources", ->
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
    @sources = new PictureTag.Sources($el.children "source")

  describe "attribute", ->

    describe "defaultSource", ->
      it "is of type PictureTag.Source", ->
        expect(@sources.defaultSource).toEqual(jasmine.any(PictureTag.Source))

    # TODO: be more specific
    xdescribe "mediaSources", ->
      it "is of type jQuery Object", ->
        expect(@sources.mediaSources).toEqual(jasmine.any($))

  describe "method", ->

    describe "best", ->
      it "returns a String", ->
        expect(@sources.best()).toEqual(jasmine.any(String))

    describe "_newSource", ->
      it "returns a PictureTag.Source", ->
        expect(@sources._newSource()).toEqual(jasmine.any(PictureTag.Source))
