window.Dindin = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: ->
    new Dindin.Routers.AppRouter()
    Backbone.history.start()
    currentUser = new Dindin.Models.User()
    currentUser.fetch()
    fridge = new Dindin.Views.UserFridge {
      model: currentUser
    }
    $('#fridge-box').append(fridge.render().$el)
    fridge.delegateEvents()
    return
}

$ ->
  Dindin.initialize()
  $('.menu-toggle').click ->
    event.preventDefault()
    toggleNav()

  $('#fridge-ingredients').sortable {
    axis: 'x,y',
    connectWith: '.ing-sort',
    cancel: '.no-drag',
  }

  toggleNav = ->
    if $('#site-wrapper').hasClass('show-nav')
      $('#site-wrapper').removeClass('show-nav')
    else 
      $('#site-wrapper').addClass('show-nav')
    return
  return

Backbone.CompositeView = Backbone.View.extend({
  addSubview: (selector, subview) ->
    selectorSubviews =
      this.subviews()[selector] || (this.subviews()[selector] = [])
    selectorSubviews.push(subview)
    $selectorEl = this.$(selector)
    $selectorEl.append(subview.$el)

  remove: ->
    Backbone.View.prototype.remove.call(this);

    _(this.subviews()).each (selectorSubviews, selector) ->
      _(selectorSubviews).each (subview) ->
        subview.remove()

  removeSubview: (selector, subview) ->
    selectorSubviews = 
      this.subviews()[selector] || (this.subviews()[selector] = [])
    subviewIndex = selectorSubviews.indexOf(subview)
    selectorSubviews.splice(subviewIndex, 1)
    subview.remove()

  removeSubviews: (selector) ->
    _(this.subviews()[selector]).each (subview) ->
      subview.remove()
    this.subviews()[selector] = []

  renderSubviews: ->
    view = this;
    _(this.subviews()).each (selectorSubviews, selector) ->
      $selectorEl = view.$(selector)
      $selectorEl.empty()
      _(selectorSubviews).each (subview) ->
        $selectorEl.append(subview.render().$el)
        subview.delegateEvents()

  subviews: ->
    if !this._subviews
      this._subviews = {}
    this._subviews
});