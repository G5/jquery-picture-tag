describe "RP.Img", ->
  $el = $('
    <picture>
      <img media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
      <img media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
      <img srcset="images/small-1.jpg 1x">
      <img src="images/small-1.jpg" alt="">
    </picture>
  ')

  beforeEach ->
    @img = new RP.Img($el.children "img:first")

  describe "method", ->

    describe "display", ->
      beforeEach ->
        spyOn(@img.$el, 'attr')
        @img.display()
      it "calls attr on $el once", ->
        expect(@img.$el.attr.calls.length).toEqual(1)
