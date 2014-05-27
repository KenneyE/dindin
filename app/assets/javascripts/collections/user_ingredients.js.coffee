Dindin.Collections.UserIngredients = Backbone.Collection.extend({
  initialize: (models, options) ->
    this.user = options.user

  model: Dindin.Models.Ingredient
})
