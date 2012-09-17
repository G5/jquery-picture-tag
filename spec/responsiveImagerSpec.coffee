describe "ResponsiveImage", ->
  it "responds to mobile", ->
    image = new ResponsiveImage()
    expect(image.mobile()).toEqual true
