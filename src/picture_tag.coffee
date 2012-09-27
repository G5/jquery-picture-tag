# Define Namespace
@PictureTag = {}

# Reference jQuery
$ = jQuery

# Add plugin object to jQuery
$.fn.pictureTag = () ->
  this.each ->
    new PictureTag.Picture($(this))
