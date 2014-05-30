window.Dindin = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: ->
    Dindin.currentUser = new Dindin.Models.User()
    Dindin.currentUser.fetch()
    new Dindin.Routers.AppRouter({
      currentUser: Dindin.currentUser
    })
    Backbone.history.start()
    fridge = new Dindin.Views.UserFridge {
      model: Dindin.currentUser
    }
    $('#fridge-box').append(fridge.render().$el)
    fridge.delegateEvents()
    return
}

$ ->
  Dindin.initialize()
  $('.menu-toggle').click (e) ->
    e.preventDefault()
    toggleNav()
  .mouseover (e) ->
    e.preventDefault()
    $('#site-wrapper').addClass('show-nav')

  $(document).keyup (e) ->
    if e.keyCode == 27
      if $('#site-wrapper').hasClass('show-nav') 
        toggleNav()
  $(document).click (e) ->
    container = $('#user-menu')
    if !container.is(e.target) && container.has(e.target).length == 0
      $('#site-wrapper').removeClass('show-nav')
  $('#user-menu a h3').sortable {
    over: (event, ui) ->
      $('#site-wrapper').addClass('show-nav')
  }
  $('.favorite-button').tooltip()
  $('.highlight').tooltip()

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