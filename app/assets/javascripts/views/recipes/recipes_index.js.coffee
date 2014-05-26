Dindin.Views.RecipesIndex = Backbone.CompositeView.extend({
  initialize: ->
    this.listenTo(this.collection, 'add', this.addRecipe)
    this.listenTo(this.collection, 'sync add', this.render)
    this.collection.each(this.addRecipe.bind(this))

  addRecipe: (recipe) ->
    recipeTileView = new Dindin.Views.RecipeTile({
      model: recipe
    })
    this.addSubview('.recipe-list', recipeTileView);
    recipeTileView.render()

  className: 'col-md-10 col-md-offset-1 recipe'

  template: JST['recipes/index']

  render: ->
    renderedContent = this.template({
      recipes: this.collection
    })
    this.$el.html(renderedContent)
    this.renderSubviews()
    this
})