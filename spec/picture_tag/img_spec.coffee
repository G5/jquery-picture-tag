describe "PictureTag.Img", ->
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
    @img = new PictureTag.Img($el.children "img:first")

  describe "method", ->

    xdescribe "display", ->
      beforeEach ->
        spyOn(@img.$el, 'attr')
        @img.display()
      it "calls attr on $el once", ->
        expect(@img.$el.attr.calls.length).toEqual(1)
