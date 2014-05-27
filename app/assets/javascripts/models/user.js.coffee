Dindin.Models.User = Backbone.Model.extend({
  url: 'api/user'

ingredients: ->
    this._ingredients = this._ingredients ||
      new Dindin.Collections.UserIngredients([], { user: this })
    this._ingredients

  parse: (resp) ->
    if resp.saved_ingredients
      this.ingredients().set(resp.saved_ingredients, { parse: true })
      delete resp.saved_ingredients
    resp
})