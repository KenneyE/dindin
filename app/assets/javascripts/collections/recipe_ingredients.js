Dindin.Collections.RecipeIngredients = Backbone.Collection.extend({
  initialize: function(models, options){
    this.recipe = options.recipe;
  },

  model: Dindin.Models.Ingredient,
})