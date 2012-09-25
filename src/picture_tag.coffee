@PictureTag = {}

$.fn.pictureTag = () ->
  this.each ->
    new PictureTag.Picture($(this))
