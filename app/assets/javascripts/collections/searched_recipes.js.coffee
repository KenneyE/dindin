Dindin.Collections.SearchedRecipes = Backbone.Collection.extend({
  model: Dindin.Models.Recipe

  comparator: (model) ->
    -model.numberOfMatches()

  url: 'api/recipes/search'
})