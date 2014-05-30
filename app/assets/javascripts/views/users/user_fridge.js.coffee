Dindin.Views.UserFridge = Backbone.CompositeView.extend({
  initialize: ->
    this.listenToOnce(this.model, 'sync', this.render)
    # this.listenTo(this.model.ingredients(), 'sync', this.render)
    this.listenTo(this.model.ingredients(), 'add', this.addIngredient)
    this.model.ingredients().each(this.addIngredient.bind(this))
    this.listenTo(Dindin.Routers.appRouter, 'route', this.fetchIngredients)
    return

  addIngredient: (ingredient) ->
    ingredientTileView = new Dindin.Views.IngredientTile({
      model: ingredient
    })
    this.addSubview('#fridge-ingredients', ingredientTileView)

  events: {
    'dblclick #fridge-ingredients li': 'removeIngredientByClick'
  },

  fetchIngredients: ->
    this.removeSubviews('#fridge-ingredients')
    this.model.ingredients().each(this.addIngredient.bind(this))
    this.render()

  removeIngredientByClick: (event) ->
    $tile = $(event.currentTarget)
    id = $tile.data('id')
    $tile.fadeOut(200, =>
      @removeIngredient(id)
    )
    return    

  removeIngredient: (id) ->
    this.removeSubviewByDataId(id, '#fridge-ingredients')
    ingredient = this.model.ingredients().get(id)
    this.model.ingredients().remove(ingredient)
    ingredientIds = this.model.ingredients().map (ingredient) ->
      ingredient.get('id')
    ingredientIds = ['empty'] if ingredientIds.length == 0 
    this.model.save({ user: {'saved_ingredient_ids': ingredientIds } }, { patch: true })

  removeSubviewByDataId: (id, selector) ->
    selectedSubview = _.find(this.subviews()[selector], (subview) -> 
      return subview.attributes()['data-id'] == id 
      )
    this.removeSubview(selector, selectedSubview);

  render: ->
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
        id = ui.item.data('id')
        @updateSavedIngredients(id)
      remove: (event, ui) =>
        id = ui.item.data('id')
        @removeIngredient(id) if ui.item.parent().hasClass('ingredient-list')
        if ui.item.parent().hasClass('selected-ingredients')
          ui.item.data('selected', true)
    }

  template: JST['users/fridge']

  updateSavedIngredients: (id) ->
    newIngredient = new Dindin.Models.Ingredient({ id: id })
    newIngredient.fetch()
    this.model.ingredients().add(newIngredient, { silent: true })
    ingredientIds = this.model.ingredients().map (ingredient) ->
      ingredient.get('id')
    ingredientIds = ['empty'] if ingredientIds.length == 0 
    if this.model.get('id')
      this.model.save({ user: {'saved_ingredient_ids': ingredientIds } }, { patch: true, silent: true })
    return
})