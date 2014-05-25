Dindin.Collections.SearchedRecipes = Backbone.Collection.extend({
  model: Dindin.Models.Recipe

  url: 'api/recipes/search'
})