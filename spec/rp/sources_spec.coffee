describe "RP.Sources", ->
  $el = $('
    <picture>
      <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
      <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
      <source srcset="images/small-1.jpg 1x">
      <img src="images/small-1.jpg" alt="">
    </picture>
  ')

  beforeEach ->
    @sources = new RP.Sources($el.children "source")

  describe "attribute", ->

    describe "defaultSource", ->
      it "is defined", ->
        expect(@sources.defaultSource).toBeDefined
      it "is of type RP.Source", ->
        expect(@sources.defaultSource).toEqual(jasmine.any(RP.Source))

    describe "mediaSources", ->
      it "is defined", ->
        expect(@sources.mediaSources).toBeDefined
      # TODO: be more specific
      it "is of type Object", ->
        expect(@sources.mediaSources).toEqual(jasmine.any(Object))

  describe "method", ->

    describe "best", ->
      it "returns a String", ->
        expect(@sources.best()).toEqual(jasmine.any(String))

    describe "_newSource", ->
      it "returns a RP.Source", ->
        expect(@sources._newSource()).toEqual(jasmine.any(RP.Source))
