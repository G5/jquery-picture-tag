$el = $('<picture>
        <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
        <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
        <source srcset="images/small-1.jpg 1x"> 
        <img src="images/small-1.jpg" alt=""> 
      </picture>')
    
$source = $($el.children('source')[0])
responsiveImage = null
afterEach -> responsiveImage = null

describe "jQuery extendo", ->
  it "responds to makeResponsive", ->
    expect($el.makeResponsive()).toBeDefined
    
describe "ResponsiveImage", ->

  describe "media query logic", ->
  
    describe "when the window is large enough for a match", ->
      beforeEach ->
        mock = window.matchMedia("(min-width: 10px)")
        spyOn(window, 'matchMedia').andReturn(mock)
        responsiveImage = new ResponsiveImage($el)
    
      it "grabs the width from the media attr", ->
        expect(responsiveImage._getMediaQueryMinWidth("<source media='(min-width: 1200px)'>")).toBe 1200
      
      it "sets the img tag src attr with given value", ->
        responsiveImage._setPictureImgSrc($el, "some_value")
        expect($el.children('img').attr('src')).toEqual "some_value"
      
      it "gets value from srcset fo any element", ->
        expect( responsiveImage._getSrcset($source) ).toBe "images/large-1.jpg 1x"
    
      it "grabs the img path from a srcset", ->
        expect( responsiveImage._getSrcFromSrcset($source)).toBe "images/large-1.jpg"
      
      it "sets the @largestMediaMinWidth to the media query min-width", ->
        expect( responsiveImage.largestMediaMinWidth ).toBe 980
    
    
      it "assigns a higher largestMediaMinWidth", ->
        el = '<source media="(min-width: 1080px)" srcset="images/large-1.jpg 1x">'
        responsiveImage._keepSrcIfBestMediaMatch($(el))
        expect( responsiveImage.largestMediaMinWidth ).toBe 1080
        
    describe "when the window is too small for any match", ->
      beforeEach ->
        mock = window.matchMedia("(min-width: 10000px)")
        spyOn(window, 'matchMedia').andReturn(mock)
        responsiveImage = new ResponsiveImage($el)
        
      it "keeps the @largestMediaMinWidth at 0", ->
        expect( responsiveImage.largestMediaMinWidth ).toBe 0
