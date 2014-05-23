Dindin.Views.RecipeNew = Backbone.CompositeView.extend({
  initialize: ->
    ingredientSelector = new Dindin.Views.IngredientSelector({
      formElSelector: '#new-recipe-form'
      })
    this.addSubview('.ingredient-selector-box', ingredientSelector)
    return

  className: 'col-md-6 col-md-offset-3 recipe'

  events: {
    'submit #new-recipe-form': 'addRecipe',
    'change #recipe-image': 'handlePhoto',
  },

  template: JST['recipes/new'],

  render: ->
    renderedContent = this.template({
      recipe: this.model
    })

    this.$el.html(renderedContent)
    this.renderSubviews()
    this

  addRecipe: (event) ->
    event.preventDefault()
    formData = $(event.target).serializeJSON()
    formData.recipe.image = this.photoFile
    recipe = new Dindin.Models.Recipe(formData)
    recipe.save({}, {
      success: ->
        Dindin.Collections.recipes.add(recipe)
        Backbone.history.navigate('/recipes/' + recipe.id, { trigger: true })
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
})