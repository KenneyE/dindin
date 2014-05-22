Dindin.Views.RecipeNew = Backbone.CompositeView.extend({
  initialize: ->
    Dindin.Collections.ingredients.fetch();
    ingredientSelector = new Dindin.Views.IngredientSelector({ 
      collection: Dindin.Collections.ingredients
      })
    this.addSubview('.ingredient-selector-box', ingredientSelector);
    return

  className: 'col-md-6 col-md-offset-3 recipe'

  events: {
    'submit #new-recipe-form': 'addRecipe',
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
    recipe = new Dindin.Models.Recipe(formData)
    recipe.save({}, {
      success: ->
        Dindin.Collections.recipes.add(recipe)
        Backbone.history.navigate('/recipes/' + recipe.id, { trigger: true })
        return
    })
    return
})