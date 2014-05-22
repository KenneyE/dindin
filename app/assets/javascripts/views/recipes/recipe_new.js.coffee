Dindin.Views.RecipeNew = Backbone.View.extend({
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
    Dindin.Collections.ingredients.fetch();
    ingNew = new Dindin.Views.IngredientNew({
      collection: Dindin.Collections.ingredients
      })
    this.$el.append(ingNew.render().$el);
    this

  addRecipe: (event) ->
    event.preventDefault()
    formData = $(event.target).serializeJSON()
    debugger
    recipe = new Dindin.Models.Recipe(formData)
    recipe.save({}, {
      success: ->
        Dindin.Collections.recipes.add(recipe)
        Backbone.history.navigate('/recipes/' + recipe.id, { trigger: true })
        return
    })
    return
})