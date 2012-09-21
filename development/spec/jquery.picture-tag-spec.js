// Generated by CoffeeScript 1.3.3
(function() {

  describe("PictureTag", function() {
    it("defines PictureTag namespace", function() {
      return expect(PictureTag).toBeDefined;
    });
    return it("defines responsivePicture method on jQuery objects", function() {
      return expect($.prototype.pictureTag).toBeDefined;
    });
  });

  describe("PictureTag.Picture", function() {
    var $el;
    $el = $('\
    <picture>\
      <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">\
      <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">\
      <source srcset="images/small-1.jpg 1x">\
      <img src="images/small-1.jpg" alt="">\
    </picture>\
  ');
    beforeEach(function() {
      return this.picture = new PictureTag.Picture($el);
    });
    describe("attribute", function() {
      return describe("sources", function() {
        return it("is of type PictureTag.Sources", function() {
          return expect(this.picture.sources).toEqual(jasmine.any(PictureTag.Sources));
        });
      });
    });
    describe("method", function() {
      xdescribe("constructor", function() {
        beforeEach(function() {
          return spyOn(this.picture, '_displayBest');
        });
        return it("calls _displayBest once", function() {
          return expect(this.picture._displayBest).toEqual(1);
        });
      });
      describe("_displayBest", function() {
        beforeEach(function() {
          spyOn(this.picture, '_displayBest').andCallThrough();
          spyOn(this.picture, '_img');
          spyOn(this.picture.sources, 'best');
          return this.picture._displayBest();
        });
        it("calls _img once", function() {
          return expect(this.picture._img.calls.length).toEqual(1);
        });
        return it("calls best on sources once", function() {
          return expect(this.picture.sources.best.calls.length).toEqual(1);
        });
      });
      return describe("_img", function() {
        return it("returns a RP.Img", function() {
          return expect(this.picture._img()).toEqual(jasmine.any(RP.Img));
        });
      });
    });
    return describe("event", function() {
      return describe("window resize", function() {
        beforeEach(function() {
          spyOn(this.picture, '_displayBest').andCallThrough();
          spyOn(this.picture, '_img');
          spyOn(this.picture.sources, 'best');
          return $(window).resize();
        });
        it("calls best on sources once", function() {
          return expect(this.picture.sources.best.calls.length).toEqual(1);
        });
        return it("calls display on img once", function() {
          return expect(this.picture._img.calls.length).toEqual(1);
        });
      });
    });
  });

  describe("PictureTag.Img", function() {
    var $el;
    $el = $('\
    <picture>\
      <img media="(min-width: 980px)" srcset="images/large-1.jpg 1x">\
      <img media="(min-width: 768px)" srcset="images/med-1.jpg 1x">\
      <img srcset="images/small-1.jpg 1x">\
      <img src="images/small-1.jpg" alt="">\
    </picture>\
  ');
    beforeEach(function() {
      return this.img = new PictureTag.Img($el.children("img:first"));
    });
    return describe("method", function() {
      return describe("display", function() {
        beforeEach(function() {
          spyOn(this.img.$el, 'attr');
          return this.img.display();
        });
        return it("calls attr on $el once", function() {
          return expect(this.img.$el.attr.calls.length).toEqual(1);
        });
      });
    });
  });

  describe("PictureTag.Sources", function() {
    var $el;
    $el = $('\
    <picture>\
      <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">\
      <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">\
      <source srcset="images/small-1.jpg 1x">\
      <img src="images/small-1.jpg" alt="">\
    </picture>\
  ');
    beforeEach(function() {
      return this.sources = new PictureTag.Sources($el.children("source"));
    });
    describe("attribute", function() {
      describe("defaultSource", function() {
        return it("is of type PictureTag.Source", function() {
          return expect(this.sources.defaultSource).toEqual(jasmine.any(PictureTag.Source));
        });
      });
      return xdescribe("mediaSources", function() {
        return it("is of type jQuery Object", function() {
          return expect(this.sources.mediaSources).toEqual(jasmine.any($));
        });
      });
    });
    return describe("method", function() {
      describe("best", function() {
        return it("returns a String", function() {
          return expect(this.sources.best()).toEqual(jasmine.any(String));
        });
      });
      return describe("_newSource", function() {
        return it("returns a PictureTag.Source", function() {
          return expect(this.sources._newSource()).toEqual(jasmine.any(PictureTag.Source));
        });
      });
    });
  });

  describe("PictureTag.Source", function() {
    var $el;
    $el = $('\
    <picture>\
      <source media="(min-width: 980px)" srcset="images/large-1.jpg 1x">\
      <source media="(min-width: 768px)" srcset="images/med-1.jpg 1x">\
      <source srcset="images/small-1.jpg 1x">\
      <img src="images/small-1.jpg" alt="">\
    </picture>\
  ');
    beforeEach(function() {
      return this.source = new PictureTag.Source($el.children("source:first"));
    });
    describe("attribute", function() {
      describe("media", function() {
        return it("is of type PictureTag.Source", function() {
          return expect(this.source.media).toEqual(jasmine.any(PictureTag.Media));
        });
      });
      return describe("srcset", function() {
        return it("is of type String", function() {
          return expect(this.source.srcset).toEqual(jasmine.any(String));
        });
      });
    });
    return describe("method", function() {
      describe("isBetterThan", function() {
        beforeEach(function() {
          spyOn(this.source.media, 'isBetterThan');
          return this.source.media.isBetterThan();
        });
        return it("calls isBetterThan on media once", function() {
          return expect(this.source.media.isBetterThan.calls.length).toEqual(1);
        });
      });
      return describe("src", function() {
        return it("returns a String", function() {
          return expect(this.source.src()).toEqual(jasmine.any(String));
        });
      });
    });
  });

  describe("PictureTag.Media", function() {
    var $el;
    $el = $('\
    <picture>\
      <media media="(min-width: 980px)" srcset="images/large-1.jpg 1x">\
      <media media="(min-width: 768px)" srcset="images/med-1.jpg 1x">\
      <media srcset="images/small-1.jpg 1x">\
      <media src="images/small-1.jpg" alt="">\
    </picture>\
  ');
    beforeEach(function() {
      return this.media = new PictureTag.Media($el.children("source:first").attr("media"));
    });
    return describe("method", function() {
      describe("isBetterThan", function() {
        it("returns true if only self matches", function() {});
        it("returns false if only other matches", function() {});
        it("returns true if we both match but self's min width is bigger", function() {});
        return it("returns false if we both match but other's min width is bigger", function() {});
      });
      describe("_matches", function() {
        it("returns false if self no query", function() {});
        it("returns true if self's query matches", function() {});
        return it("returns false if self's query does not match", function() {});
      });
      return describe("_minWidth", function() {
        return it("returns an Int", function() {});
      });
    });
  });

}).call(this);
