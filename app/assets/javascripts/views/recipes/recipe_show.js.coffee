Dindin.Views.RecipeShow = Backbone.View.extend({
  initialize: -> 
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(Dindin.currentUser, 'sync', this.render)

  className: 'col-md-8 col-md-offset-2 recipe recipe-show',

  events: {
    'click .favorite-button': 'toggleFavorite'
  }

  template: JST['recipes/show'],

  render: ->
    if Dindin.currentUser.favoriteRecipes().findWhere({id: this.model.id})
      favorited = "favorited"
      addOrRemove = "remove from"
    else
      favorited = ""
      addOrRemove = "add to"
    renderedContent = this.template({
      recipe: this.model,
      ingredientMatches: this.model.ingredientMatches()
      otherIngredients: this.model.otherIngredients() 
      favorited: favorited
      addOrRemove: addOrRemove
    })
    this.$el.html(renderedContent)
    $('span.favorite-button').popover({
    trigger: 'hover'
    })
    this

  toggleFavorite: ->
    id = this.model.id
    recipes = Dindin.currentUser.favoriteRecipes()
    if recipes.findWhere({id: this.model.id})
      recipes.remove(this.model)
    else
      recipes.add(this.model)
    recipeIds = recipes.map (recipe) ->
      recipe.get('id')
    recipeIds = ['empty'] if recipeIds.length == 0
    Dindin.currentUser.save({ user: {'favorite_recipe_ids': recipeIds } }, { patch: true })
})