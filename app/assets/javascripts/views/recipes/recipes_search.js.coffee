Dindin.Views.RecipesSearch = Backbone.CompositeView.extend({
  initialize: ->
    Dindin.currentUser.fetch()
    this.collection = new Dindin.Collections.SearchedRecipes()
    this.ingredientSelector = new Dindin.Views.IngredientSelector({
      formElSelector: '#recipe-search-form'
    });
    recipeMatches = new Dindin.Views.RecipeMatches({
      collection: this.collection
    });
    this.addSubview('.recipe-matches', recipeMatches)
    this.addSubview('.ingredient-selector-box', this.ingredientSelector)

  className: 'col-md-12 recipe'

  events: {
    'ingredientSelected .selected-ingredients': 'handleSelect'
  },

  handleSelect: (event, data) ->
    this.searchByIds(data.ids)

  template: JST['recipes/search']

  render: ->
    renderedContent = this.template()
    this.$el.html(renderedContent)
    this.renderSubviews()
    this.setSortable()
    this.togglePlaceholder()
    this

  setSortable: ->
    this.$el.find('.ing-sort').sortable({
      axis: 'x,y',
      cancel: '.no-drag',
      connectWith: '.ing-sort',
      receive: (event, ui) =>
        ingredientIds = $('.selected-ingredients')
          .sortable('toArray', { attribute: 'data-id'} )
        ingredientIds = _(ingredientIds).filter (id) -> id != ""
        @ingredientSelector.toggleSelected(ui.item)
        @searchByIds(ingredientIds)
      update: (event, ui) =>
        @togglePlaceholder()
    })

  searchByIds: (ids) ->
    this.collection.reset()
    if ids.length > 0
      formData = {
        'ingredient_ids': ids,
      }
      this.collection.fetch({
        data: $.param(formData),
        add: true,
      })

  togglePlaceholder: ->
    $ingredientSelector = this.$el.find('.selected-ingredients')
    if $ingredientSelector.children().length == 0
      $ingredientSelector.append('<h3 class="text-center placeholder no-drag">Drag and drop ingredient tiles here to search for recipes.</h3>')
    else
      $ingredientSelector.find('.placeholder').remove()
})