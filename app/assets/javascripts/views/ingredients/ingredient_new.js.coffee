Dindin.Views.IngredientNew = Backbone.View.extend({
  initialize: (options) ->
    this.text = options.text
    return

  addIngredient: (event) ->
    event.preventDefault()
    $modal = $('#new-ingredient-modal')
    formData = $(event.target).serializeJSON()
    ingredient = new Dindin.Models.Ingredient(formData)
    $modal.on('hidden.bs.modal', (e) ->
      ingredient.save({}, {
        success: ->
          ingredient.fetch()
          Dindin.Collections.ingredients.add(ingredient)
          return
      }))
    $modal.modal('hide');
    return

  events: {
    'submit #new-ingredient-form': 'addIngredient'
  }

  render: ->
    renderedContent = this.template({
      text: this.text
    })
    this.$el.html(renderedContent)
    this

  template: JST['ingredients/_new']
})