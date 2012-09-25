describe "PictureTag.Media", ->
  $el = $('
    <picture>
      <media media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
      <media media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
      <media srcset="images/small-1.jpg 1x">
      <media src="images/small-1.jpg" alt="">
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
