// Generated by CoffeeScript 1.3.3
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.RP = {};

  $.fn.responsivePicture = function() {
    return this.each(function() {
      return new RP.Picture($(this));
    });
  };

  this.RP.Picture = (function() {

    function Picture($el) {
      this.$el = $el;
      this._displayBestSrc = __bind(this._displayBestSrc, this);

      this.sources = new RP.Sources(this.$el.children("source"));
      this.img = new RP.Img(this.$el.children("img:first"));
      this._displayBestSrc();
      $(window).resize(this._displayBestSrc);
    }

    Picture.prototype._displayBestSrc = function() {
      return this.img.display(this.sources.best());
    };

    return Picture;

  })();

  this.RP.Img = (function() {

    function Img($el) {
      this.$el = $el;
    }

    Img.prototype.display = function(value) {
      return this.$el.attr("src", value);
    };

    return Img;

  })();

  this.RP.Sources = (function() {

    function Sources($els) {
      this.$els = $els;
      this._newSource = __bind(this._newSource, this);

      this.best = __bind(this.best, this);

      this.defaultSource = new RP.Source(this.$els.filter(":not([media])"));
      this.mediaSources = this.$els.filter("[media]").map(this._newSource);
    }

    Sources.prototype.best = function() {
      var bestSoFar,
        _this = this;
      bestSoFar = this.defaultSource;
      this.mediaSources.each(function(i, mediaSource) {
        if (mediaSource.isBetterThan(bestSoFar)) {
          return bestSoFar = mediaSource;
        }
      });
      return bestSoFar.src();
    };

    Sources.prototype._newSource = function(i, el) {
      return new RP.Source($(el));
    };

    return Sources;

  })();

  this.RP.Source = (function() {

    function Source($el) {
      this.$el = $el;
      this.media = new RP.Media(this.$el.attr("media"));
      this.srcset = this.$el.attr("srcset");
    }

    Source.prototype.isBetterThan = function(other) {
      var thing;
      thing = this.media.isBetterThan(other.media);
      return thing;
    };

    Source.prototype.src = function() {
      if (this.srcset) {
        return this.srcset.match(/^\S+/)[0];
      }
    };

    return Source;

  })();

  this.RP.Media = (function() {

    function Media(query) {
      this.query = query;
    }

    Media.prototype.isBetterThan = function(other) {
      if (this._matches() && !other._matches()) {
        return true;
      } else if (this._matches() && other._matches()) {
        return this._minWidth >= other.minWidth;
      } else {
        return false;
      }
    };

    Media.prototype._matches = function() {
      return this.query && matchMedia(this.query).matches;
    };

    Media.prototype._minWidth = function() {
      return parseInt(this.query.match(/\d+/)[0]);
    };

    return Media;

  })();

}).call(this);
