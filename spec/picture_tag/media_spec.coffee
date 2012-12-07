describe "PictureTag.Media", ->
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
    @media = new PictureTag.Media($el.children("source:first").attr("media"))

  describe "method", ->

    describe "isBetterThan", ->
      it "returns true if only self matches", ->
      it "returns false if only other matches", ->
      it "returns true if we both match but self's min width is bigger", ->
      it "returns false if we both match but other's min width is bigger", ->

    describe "_matches", ->
      it "returns false if self no query", ->
      it "returns true if self's query matches", ->
      it "returns false if self's query does not match", ->

    describe "_minWidth", ->
      it "returns an Int", ->
