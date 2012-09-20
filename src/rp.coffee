@RP = {}

$.fn.responsivePicture = () ->
  this.each ->
    new RP.Picture($(this))
