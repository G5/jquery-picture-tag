describe "PictureTag", ->
  it "defines PictureTag namespace", ->
    expect(PictureTag).toBeDefined

  it "defines responsivePicture method on jQuery objects", ->
    expect($.prototype.pictureTag).toBeDefined
