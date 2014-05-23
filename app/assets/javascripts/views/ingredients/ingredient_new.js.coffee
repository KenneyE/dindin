Dindin.Views.IngredientNew = Backbone.View.extend({

  addIngredient: (event) ->
    event.preventDefault()
    formData = $(event.target).serializeJSON()
    formData.ingredient.image = this.photoFile
    ingredient = new Dindin.Models.Ingredient(formData)
    ingredient.save({}, {
      success: ->
        Dindin.Collections.ingredients.add(ingredient)
        # Backbone.history.navigate('/ingredients/' + ingredient.id, { trigger: true })
        return
    })
    return

  handlePhoto: (event) ->
    that = this
    file = $(event.target)[0].files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      that.photoFile = e.target.result
      return
    reader.readAsDataURL(file)
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