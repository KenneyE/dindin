Dindin.Views.RecipeTile = Backbone.View.extend({
  initialize: (options) ->

  template: JST['recipes/_tile']

  events: {
    'click div.recipe-tile': 'goToShowPage'
    # 'mouseenter div.quick-flip': 'quickFlip'
    # 'mouseleave div.quick-flip': 'quickFlip'
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

  # quickFlip: (event) ->
  #   $(event.currentTarget).quickFlipper({
  #     openSpeed: 300,
  #     closeSpeed: 300,
  #   })

  render: ->
    renderedContent = this.template({
        recipe: this.model
        userIngredients: Dindin.currentUser.ingredients().pluck('name')
    })
    this.$el.html(renderedContent)
    this

  tagName: 'li'
})