Dindin.Collections.SearchedRecipes = Backbone.Collection.extend({
  model: Dindin.Models.Recipe

  comparator: 'numberOfmatches'

  url: 'api/recipes/search'
})