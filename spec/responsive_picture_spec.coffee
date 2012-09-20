$el = $('<picture>
        <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
        <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
        <source srcset="images/small-1.jpg 1x"> 
        <img src="images/small-1.jpg" alt=""> 
      </picture>')
    
$source = $($el.children('source')[0])
picture = null
afterEach -> picture = null

describe "jQuery extendo", ->
  it "responds to responsivePicture", ->
    expect($el.responsivePicture()).toBeDefined
    
describe "ResponsivePicture", ->

  describe "media query logic", ->
    
    describe "getting the src from srcset", ->
      beforeEach ->
        picture = new ResponsivePicture($el)
      
    it "ignores the ',' when using multiple queries", ->
      el = '<source media="(min-width: 1080px)" srcset="images/large-1@1x.jpg, images/large-1.jpg@2x 2x, ">'
      expect( picture._getSrcFromSrcset($(el)) ).toEqual "images/large-1@1x.jpg"
    
    it "grabs the src before the 1x"
      el = '<source media="(min-width: 1080px)" srcset="images/large-1@1x.jpg 1x, images/large-1.jpg@2x 2x, ">'
      expect( picture._getSrcFromSrcset($(el)) ).toEqual "images/large-1@1x.jpg"
  
    describe "when the window is large enough for a match", ->
      beforeEach ->
        mock = window.matchMedia("(min-width: 10px)")
        spyOn(window, 'matchMedia').andReturn(mock)
        picture = new ResponsivePicture($el)
    
      it "grabs the width from the media attr", ->
        expect(picture._getMediaQueryMinWidth("<source media='(min-width: 1200px)'>")).toBe 1200
      
      it "sets the img tag src attr with given value", ->
        picture._setPictureImgSrc($el, "some_value")
        expect($el.children('img').attr('src')).toEqual "some_value"
      
      it "gets value from srcset fo any element", ->
        expect( picture._getSrcset($source) ).toBe "images/large-1.jpg 1x"
    
      it "grabs the img path from a srcset", ->
        expect( picture._getSrcFromSrcset($source)).toBe "images/large-1.jpg"
      
      it "sets the @largestMediaMinWidth to the media query min-width", ->
        expect( picture.largestMediaMinWidth ).toBe 980
    
    
      it "assigns a higher largestMediaMinWidth", ->
        el = '<source media="(min-width: 1080px)" srcset="images/large-1.jpg 1x">'
        picture._keepSrcIfBestMediaMatch($(el))
        expect( picture.largestMediaMinWidth ).toBe 1080
        
    describe "when the window is too small for any match", ->
      beforeEach ->
        mock = window.matchMedia("(min-width: 10000px)")
        spyOn(window, 'matchMedia').andReturn(mock)
        picture = new ResponsivePicture($el)
        
      it "keeps the @largestMediaMinWidth at 0", ->
        expect( picture.largestMediaMinWidth ).toBe 0
