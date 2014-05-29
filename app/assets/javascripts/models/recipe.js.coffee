Dindin.Models.Recipe = Backbone.Model.extend({
  initialize: ->
    this.matchedIngredients = this.ingredientMatches()

  urlRoot: '/api/recipes',

  ingredientMatches: ->
    _(this.get('ingredients')).filter (ingredient) ->
      Dindin.currentUser.ingredients().where({name: ingredient}).length > 0
})