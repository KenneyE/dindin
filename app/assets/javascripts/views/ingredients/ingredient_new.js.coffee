Dindin.Views.IngredientNew = Backbone.View.extend({

  addIngredient: (event) ->
    event.preventDefault()
    formData = $(event.target).serializeJSON()
    ingredient = new Dindin.Models.Ingredient(formData)
    ingredient.save({}, {
      success: ->
        Dindin.Collections.ingredients.add(ingredient)
        # Backbone.history.navigate('/ingredients/' + ingredient.id, { trigger: true })
        return
    })
    return

  events: {
    'submit #new-ingredient-form': 'addIngredient'
    'change #ingredient-image': 'handlePhoto'
  }

  render: ->
    renderedContent = this.template({
      ingredient: this.model
    })
    this.$el.html(renderedContent)
    this

  template: JST['ingredients/_new']
})