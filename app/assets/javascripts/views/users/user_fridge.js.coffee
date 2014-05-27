Dindin.Views.UserFridge = Backbone.CompositeView.extend({
  initialize: ->
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.ingredients(), 'sync add', this.render)
    this.listenTo(this.model.ingredients(), 'add', this.addIngredient)
    this.model.ingredients().each(this.addIngredient.bind(this))
    return

  addIngredient: (ingredient) ->
    ingredientTileView = new Dindin.Views.IngredientTile({
      model: ingredient
    });
    this.addSubview('#fridge-ingredients', ingredientTileView);
    ingredientTileView.render();

  render: ->
    this.model.set({ username: 'Guest' }) unless this.model.escape('username')
    renderedContent = this.template({
      user: this.model
    })
    this.$el.html(renderedContent)
    this.renderSubviews()
    this.setSortable()
    this

  setSortable: ->
    this.$el.find('.ing-sort').sortable {
      axis: 'x,y',
      connectWith: '.ing-sort',
      cancel: '.no-drag',
    }

  template: JST['users/fridge']
})