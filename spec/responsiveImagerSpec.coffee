describe "ResponsiveImage", ->
  it "responsds to mobile", ->
    image = new ResponsiveImage()
    expect(image.mobile()).toEqual true
