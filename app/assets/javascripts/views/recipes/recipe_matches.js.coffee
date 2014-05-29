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
    this.toggleEmptyPrompt()
    this

  removeRecipes: ->
    this.removeSubviews('.recipe-list')

  toggleEmptyPrompt: ->
    if $.isEmptyObject(this.subviews()) || this.subviews()['.recipe-list'].length == 0
      this.$el.find('.recipe-list').append("<h4 class='text-center placeholder'>No recipes currently found. 
        Try adding or removing ingredients from the selector to discover new recipes.</h4>")
    return
})