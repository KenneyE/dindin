Dindin.Views.RecipesSearch = Backbone.CompositeView.extend({
  initialize: ->
    Dindin.currentUser.fetch({
      success: =>
        @startTour() unless Dindin.hadTours["search"] == true
    })
    this.collection = new Dindin.Collections.SearchedRecipes()
    this.ingredientSelector = new Dindin.Views.IngredientSelector({
      formElSelector: '#recipe-search-form'
    });
    recipeMatches = new Dindin.Views.RecipeMatches({
      collection: this.collection
    });
    this.addSubview('.recipe-matches', recipeMatches)
    this.addSubview('.ingredient-selector-box', this.ingredientSelector)

  addSearchSpinner: ->
    spinnerOpts = {
      lines: 13,
      length: 20,
      width: 20, 
      radius: 30,
      corners: 1,
      rotate: 0,
      direction: 1,
      color: '#5A966E',
      speed: 0.8,
      trail: 60,
      shadow: false,
      hwaccel: true,
      className: 'spinner',
      zIndex: 2e9,
      top: '50%',
      left: '50%'
    }
    this.spinner = new Spinner(spinnerOpts).spin()
    $('#loading').show()
    $('#loading').append(this.spinner.el)

  className: 'col-md-12 recipe'

  events: {
    'ingredientSelected .selected-ingredients': 'handleSelect'
  },

  handleSelect: (event, data) ->
    this.searchByIds(data.ids)

  template: JST['recipes/search']

  removeSearchSpinner: ->
    this.spinner.stop()
    $('#loading').hide()

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
        unless ui.sender.attr('id') == 'fridge-ingredients'
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
      this.addSearchSpinner()
      $recipes = $('.recipe-list')
      this.collection.fetch({
        data: $.param(formData),
        add: true,
        success: =>
          @removeSearchSpinner()
      })
      if Shepherd.activeTour
        Shepherd.activeTour.show('recipeMatches')

  startTour: ->
    if Dindin.currentUser.get('username') == 'Guest' || 
      parseInt(Date.now()/1000) - Dindin.currentUser.get('created_at') < 4000
        Dindin.Tours.searchTour.start()
        Dindin.hadTours["search"] = true

  togglePlaceholder: ->
    $ingredientSelector = this.$el.find('.selected-ingredients')
    if $ingredientSelector.children().length == 0
      $ingredientSelector.append('<h3 class="text-center placeholder no-drag">Drag and drop ingredient tiles here to search for recipes.</h3>')
    else
      $ingredientSelector.find('.placeholder').remove()
})