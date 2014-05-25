Dindin.Views.RecipeTile = Backbone.View.extend({
  template: JST['recipes/_tile']

  events: {
    'click div.caption': 'goToShowPage'
  },

  goToShowPage: (event) ->
    that = this
    if this.model.id
      Backbone.history.navigate('/recipes/' + this.model.id, { trigger: true })
    else
      this.model.save({}, {
        success: ->
          that.model.fetch({
            success: ->
              Backbone.history.navigate('/recipes/' + this.model.id, { trigger: true })
        })
      })


  render: ->
    renderedContent = this.template({
        recipe: this.model
    })
    this.$el.html(renderedContent)
    this

  tagName: 'li'
})