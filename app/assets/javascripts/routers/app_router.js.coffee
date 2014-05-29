Dindin.Routers.AppRouter = Backbone.Router.extend({
  initialize: ->

  routes: {
    "": "recipesSearch",
    "recipes": "recipesIndex",
    "recipes/:id": "recipeShow",
    "ingredients": "ingredientsIndex",
  },

  ingredientsIndex: ->
    Dindin.Collections.ingredients.fetch()
    ingredientsIndexView = new Dindin.Views.IngredientsIndex({
      collection: Dindin.Collections.ingredients
    })
    this._swapView(ingredientsIndexView)

  recipesIndex: ->
    Dindin.Collections.recipes.fetch()
    recipesIndexView = new Dindin.Views.RecipesIndex({
      collection: Dindin.Collections.recipes
    })
    this._swapView(recipesIndexView)

  recipesSearch: ->
    recipesSearchView = new Dindin.Views.RecipesSearch({
    })
    this._swapView(recipesSearchView)

  recipeShow: (id) ->
    Dindin.Collections.recipes.fetch()
    recipe = Dindin.Collections.recipes.getOrFetchById(id);
    recipeShowView = new Dindin.Views.RecipeShow({
      model: recipe
    })
    this._swapView(recipeShowView)

  _swapView: (newView) ->
    if this.currentView 
      this.currentView.remove()
    $('#content').html(newView.render().$el)
    this.currentView = newView
})