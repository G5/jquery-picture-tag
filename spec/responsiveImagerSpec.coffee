el = '<picture>
        <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">
        <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">
        <source srcset="images/small-1.jpg 1x"> 
        <img src="images/small-1.jpg" alt=""> 
      </picture>'  
responsiveImage = new ResponsiveImage($(el))

describe "jQuery extendo", ->
  it "responds to makeResponsive", ->
    expect($(el).makeResponsive()).toBeDefined
    
describe "ResponsiveImage", ->
  describe "media query logic", ->
    it "grabs the width from the media attr", ->
      expect(responsiveImage._getMediaQueryMinWidth("<source media='(min-width: 1200px)'>")).toBe 1200
    