describe "RP", ->
  it "defines RP namespace", ->
    expect(RP).toBeDefined

  it "defines responsivePicture method on jQuery objects", ->
    expect($.prototype.responsivePicture).toBeDefined
