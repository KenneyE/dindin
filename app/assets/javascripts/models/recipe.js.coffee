Dindin.Models.Recipe = Backbone.Model.extend({
  initialize: ->
    this.matchedIngredients = this.ingredientMatches()

  urlRoot: '/api/recipes',

  ingredientMatches: ->
    matches = []
    that = this
    Dindin.currentUser.ingredients().each (userIngredient) ->
      matchString = userIngredient.get('name')
      if matchString[matchString.length-1] == 's'
        matchString = matchString.slice(0, matchString.length-1)
      pattern = new RegExp("\s*" + matchString + "\s*", 'i')
      _(that.get('ingredients')).each (ingredient) ->
        matches.push(ingredient) if pattern.test(ingredient)
        return
      return
    this._matches = _.uniq(matches)
    this._matches

  numberOfMatches: ->
    this.ingredientMatches().length

  otherIngredients: ->
    _(this.get('ingredients')).filter (ingredient) =>
      @ingredientMatches().indexOf(ingredient) == -1
})