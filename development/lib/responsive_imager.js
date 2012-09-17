// Generated by CoffeeScript 1.3.3
(function() {
  var $,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  $ = jQuery;

  this.ResponsiveImage = (function() {

    function ResponsiveImage($el) {
      this.$el = $el;
      this._doSomething = __bind(this._doSomething, this);

      this.highestMatch = 0;
      this.mediaSource = void 0;
      this.mediaQuery = void 0;
      this.screenWidth = 0;
      this._doSomething();
      this._initBehavior();
    }

    ResponsiveImage.prototype._initBehavior = function() {
      return $(window).resize(this._doSomething);
    };

    ResponsiveImage.prototype._doSomething = function() {
      var _this = this;
      this.highestMatch = 0;
      this.mediaSource = this.$el.children("source:not([media])").attr("srcset").match(/^\S+/)[0];
      this.$el.children("source").each(function(i, el) {
        _this.mediaQuery = $(el).attr("media");
        if (matchMedia(_this.mediaQuery).matches) {
          _this.screenWidth = _this.mediaQuery.match(/\d+/);
          if (_this.screenWidth >= _this.highestMatch) {
            _this.highestMatch = _this.screenWidth;
            _this.mediaSource = $(el).attr("srcset").match(/^\S+/)[0];
            return console.log(_this.mediaSource);
          }
        }
      });
      console.log(this.mediaSource);
      return this.$el.children("img").attr("src", this.mediaSource);
    };

    return ResponsiveImage;

  })();

  $.fn.makeResponsive = function() {
    var $pictures;
    $pictures = this;
    return $pictures.each(function() {
      var ri;
      return ri = new ResponsiveImage($(this));
    });
  };

}).call(this);
