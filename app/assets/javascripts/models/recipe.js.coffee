Dindin.Models.Recipe = Backbone.Model.extend({
  initialize: ->
    this.matchedIngredients = this.ingredientMatches()

  urlRoot: '/api/recipes',

  ingredientMatches: ->
    if this._matches
      return this._matches
    else
    this._matches = []
    Dindin.currentUser.ingredients().each (userIngredient) =>
      matchString = userIngredient.get('name')
      if matchString[matchString.length-1] == 's'
        matchString = matchString.slice(0, matchString.length-1)
      pattern = new RegExp("\s*" + matchString + "\s*", 'i')
      _(@get('ingredients')).each (ingredient) =>
        @_matches.push(ingredient) if pattern.test(ingredient)
        return
      return
    this.matches

  numberOfMatches: ->
    this.ingredientMatches().length

  otherIngredients: ->
    _(this.get('ingredients')).filter (ingredient) =>
      @ingredientMatches().indexOf(ingredient) == -1
})