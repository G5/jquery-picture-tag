# jQuery Picture Tag

[![Build Status](https://travis-ci.org/G5/jquery-picture-tag.png)](https://travis-ci.org/G5/jquery-picture-tag)

jQuery Plugin that implements the [W3C Picture Element Proposal](http://www.w3.org/community/respimg/) (the `<picture>` tag)


## Current Version

0.0.1


## Requirements

### Development

- [Node.js](http://nodejs.org)
- [CoffeeScript](http://coffeescript.org)
- [/dependencies](https://github.com/G5/jquery-picture-tag/tree/master/dependencies)

### Production

* [jQuery](http://jquery.com)
* [matchMedia.js](https://github.com/paulirish/matchMedia.js) for older browsers


## Installation

Include `jquery-picture-tag-x.y.z.js` in your HTML file, where x.y.z is the current version.

If you're using Rails then [jquery_picture_tag-rails](https://github.com/G5/jquery_picture_tag-rails) will include the javascript for you.

```html
<script src="jquery-picture-tag-x.y.z.js"></script>
```


## Usage

Use the [W3C Picture Element Proposal](http://www.w3.org/community/respimg/)'s `<picture>` tag syntax.

If you're using Rails then [picture_tag-rails](https://github.com/G5/picture_tag-rails) will generate the markup for you.

```html
<picture alt="Kitty cat!">
  <source media="(min-width: 1600px)" srcset="cat-huge.jpg 1x,   cat-huge@2x.jpg 2x">
  <source media="(min-width: 1000px)" srcset="cat-large.jpg 1x,  cat-large@2x.jpg 2x">
  <source media="(min-width: 768px)"  srcset="cat-medium.jpg 1x, cat-medium@2x.jpg 2x">
  <source media="(min-width: 480px)"  srcset="cat-small.jpg 1x,  cat-small@2x.jpg 2x">
  <source                             srcset="cat-tiny.jpg 1x,   cat-tiny@2x.jpg 2x">
  <img alt="Kitty cat!"               src="cat-tiny.jpg">
</picture>
```

Put this Javascript somewhere to apply it to all `<picture>` tags.

```javascript
$(function() {
  $('picture').pictureTag();
});
```

Or this to apply it to just some `<picture>` tags.

```javascript
$(function() {
  $('.gallery picture').pictureTag();
});
```


## Examples

* [http://G5.github.com/jquery-picture-tag/development/example.html](http://G5.github.com/jquery-picture-tag/development/example.html)


## Authors

* Jessica Lynn Suttles / [@jlsuttles](https:github.com/jlsuttles)
* Bookis Smuin / [@bookis](https:github.com/bookis)


## Contributions

1. Fork it
2. Get it running (see below)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Write your code and **specs**
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request

If you find bugs, have feature requests or questions, please
[file an issue](https://github.com/G5/jquery-picture-tag/issues).

### CoffeeScript

```bash
brew upgrade
brew install nodejs
npm install --global coffee-script
```

### Specs

```bash
cake spec
open development/spec-runner.html
```

### Releases

```bash
echo -n "x.y.z" > VERSION
cake release
```


## License

Copyright (c) 2012 G5

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
