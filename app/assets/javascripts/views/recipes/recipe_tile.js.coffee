Dindin.Views.RecipeTile = Backbone.View.extend({
  initialize: ->
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(Dindin.currentUser, 'sync', this.render)

  template: JST['recipes/_tile']

  events: {
    'click div.recipe-tile': 'goToShowPage'
  },

  goToShowPage: (event) ->
    that = this
    if this.model.id
      Backbone.history.navigate('/recipes/' + this.model.id, { trigger: true })
    else
      this.model.save({}, {
        success: =>
          @model.fetch({
            success: =>
              Backbone.history.navigate('/recipes/' + @model.id, { trigger: true })
              return
          })
          return
      })
      return
      
  render: ->
    renderedContent = this.template({
        recipe: this.model
        matchedIngredients: this.model.ingredientMatches()
        otherIngredients: this.model.otherIngredients()
    })
    this.$el.html(renderedContent)
    this

  tagName: 'li'
})