window.Dindin = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Dindin.Routers.AppRouter();
    Backbone.history.start();
  }
};

$(document).ready(function() {
  Dindin.initialize();

  $('.menu-toggle').click(function() {
    toggleNav();
  });

  $('#fridge-ingredients').sortable({
    axis: 'x,y',
    connectWith: '.ing-sort',
    cancel: '.no-drag',
  })
});


function toggleNav() {
  if ($('#site-wrapper').hasClass('show-nav')) {
    $('#site-wrapper').removeClass('show-nav');
  } else {
    $('#site-wrapper').addClass('show-nav');
  }
}

Backbone.CompositeView = Backbone.View.extend({
  addSubview: function (selector, subview){
    var selectorSubviews =
      this.subviews()[selector] || (this.subviews()[selector] = []);

    selectorSubviews.push(subview);

    var $selectorEl = this.$(selector);
    $selectorEl.append(subview.$el);
  },

  remove: function () {
    Backbone.View.prototype.remove.call(this);

    _(this.subviews()).each(function (selectorSubviews, selector) {
      _(selectorSubviews).each(function (subview) {
        subview.remove();
      });
    });
  },

  removeSubview: function (selector, subview) {
    var selectorSubviews = 
      this.subviews()[selector] || (this.subviews()[selector] = []);

    var subviewIndex = selectorSubviews.indexOf(subview);
    selectorSubviews.splice(subviewIndex, 1);
    subview.remove();
  },

  removeSubviews: function(selector){
    _(this.subviews()[selector]).each(function(subview){
      subview.remove();
    });
    this.subviews()[selector] = [];
  },

  renderSubviews: function(){
    var view = this;

    _(this.subviews()).each(function (selectorSubviews, selector) {
      var $selectorEl = view.$(selector);
      $selectorEl.empty();

      _(selectorSubviews).each(function (subview) {
        $selectorEl.append(subview.render().$el);
        subview.delegateEvents();
      });
    });
  },

  subviews: function () {
    if (!this._subviews){
      this._subviews = {};
    }

    return this._subviews;
  },
});