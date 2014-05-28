Dindin.Views.RecipeShow = Backbone.View.extend({
  initialize: (options) -> 
    this.currentUser = options.currentUser
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.currentUser, 'sync', this.render)

  className: 'col-md-8 col-md-offset-2 recipe recipe-show',

  events: {
    'click .favorite-button': 'toggleFavorite'
  }

  template: JST['recipes/show'],

  render: ->
    if this.currentUser.favoriteRecipes().findWhere({id: this.model.id})
      favorited = "favorited"
      addOrRemove = "remove from"
    else
      favorited = ""
      addOrRemove = "add to"
    renderedContent = this.template({
      recipe: this.model,
      ingredients: this.model.get('ingredients')
      favorited: favorited
      addOrRemove: addOrRemove
    })
    this.$el.html(renderedContent)
    this

  toggleFavorite: ->
    id = this.model.id
    recipes = this.currentUser.favoriteRecipes()
    if recipes.findWhere({id: this.model.id})
      recipes.remove(this.model)
    else
      recipes.add(this.model)
    recipeIds = recipes.map (recipe) ->
      recipe.get('id')
    this.currentUser.save({ user: {'favorite_recipe_ids': recipeIds } }, { patch: true })
})