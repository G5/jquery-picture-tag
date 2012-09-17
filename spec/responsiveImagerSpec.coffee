describe "jQuery extendo", ->
  it "responds to doSomething", ->
    image = new ResponsiveImage($('img'))
    expect(image.element).toEqual $('img')
