Dindin.Collections.SearchedRecipes = Backbone.Collection.extend({
  model: Dindin.Models.Recipe

  comparator: 'matchedIngredients'

  url: 'api/recipes/search'
})