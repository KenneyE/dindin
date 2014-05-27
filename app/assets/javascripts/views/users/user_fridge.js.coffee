Dindin.Views.UserFridge = Backbone.CompositeView.extend({
  initialize: ->
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.ingredients(), 'sync', this.render)
    this.listenTo(this.model.ingredients(), 'add', this.addIngredient)
    this.model.ingredients().each(this.addIngredient.bind(this))
    return

  addIngredient: (ingredient) ->
    ingredientTileView = new Dindin.Views.IngredientTile({
      model: ingredient
    })
    this.addSubview('#fridge-ingredients', ingredientTileView)
    ingredientTileView.render()

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
      receive: (event, ui) =>
        if this.model.get('id')
          id = ui.item.data('id');
          @updateSavedIngredients(id)
    }

  template: JST['users/fridge']

  updateSavedIngredients: (id) ->
    newIngredient = new Dindin.Models.Ingredient({ id: id })
    newIngredient.fetch()
    this.model.ingredients().add(newIngredient)
    ingredientIds = this.model.ingredients().map (ingredient) ->
      ingredient.get('id')
    this.model.fetch()
    this.model.save({ user: {'saved_ingredient_ids': ingredientIds } }, { patch: true })
    return
})