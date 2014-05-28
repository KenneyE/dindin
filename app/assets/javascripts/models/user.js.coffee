Dindin.Models.User = Backbone.Model.extend({
  url: 'api/user'

  favoriteRecipes: ->
    this._favoriteRecipes = this._favoriteRecipes ||
      new Dindin.Collections.UserFavoriteRecipes([], { user: this })
    this._favoriteRecipes

  ingredients: ->
    this._ingredients = this._ingredients ||
      new Dindin.Collections.UserIngredients([], { user: this })
    this._ingredients

  parse: (resp) ->
    if resp.saved_ingredients
      this.ingredients().set(resp.saved_ingredients, { parse: true })
      delete resp.saved_ingredients
    if resp.favorite_recipes
      this.favoriteRecipes().set(resp.favorite_recipes, { parse: true })
      delete resp.favorite_recipes
    resp
})