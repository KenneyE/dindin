Dindin.Views.IngredientTile = Backbone.View.extend({
  attributes: ->
    {
      'data-id': this.model.id,
      'data-selected': 'false',
    }

  addTileColor: ->
    category = this.model.get('category')
    color = switch
      when category == 'Protein' then 'btn-danger'
      when category == 'Vegetables' then 'btn-success'
      when category == 'Fruit' then 'btn-primary'
      when category == 'Grains & Legumes' then 'btn-warning'
      else 'btn-info'
    color

  tagName: 'li'

  template: JST['ingredients/_tile']

  render: ->
    renderedContent = this.template({
      ingredient: this.model
      tileColor: this.addTileColor()
    })
    this.$el.html(renderedContent)
    this
})