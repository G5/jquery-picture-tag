describe("ResponsiveImage", function() {
  it("responsds to mobile", function() {
    image = new ResponsiveImage();
    expect(image.mobile()).toEqual(true);
  });
});