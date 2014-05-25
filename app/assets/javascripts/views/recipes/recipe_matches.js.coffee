Dindin.Views.RecipeMatches = Backbone.CompositeView.extend({
  initialize: ->
    this.listenTo(this.collection, 'reset', this.removeRecipes)
    this.listenTo(this.collection, 'add', this.addRecipe)
    this.listenTo(this.collection, 'sync add', this.render)
    this.collection.each(this.addRecipe.bind(this))

  template: JST['recipes/_matches']

  addRecipe: (recipe) ->
    recipeTileView = new Dindin.Views.RecipeTile({
      model: recipe
    });
    this.addSubview('.recipe-list', recipeTileView)
    recipeTileView.render()

  render: ->
    renderedContent = this.template()
    this.$el.html(renderedContent)
    this.renderSubviews()
    this

  removeRecipes: ->
    this.removeSubviews('.recipe-list')
})