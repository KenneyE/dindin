Dindin.Views.IngredientSelector = Backbone.CompositeView.extend({
  initialize: (options) ->
    this.formElSelector = options.formElSelector
    this.collection = Dindin.Collections.ingredients
    this.collection.fetch()
    this.collection.each(this.addIngredient.bind(this))
    this.listenTo(this.collection, 'add', this.addIngredient)
    this.listenTo(this.collection, 'sync', this.render)
    this.selectedIds = []
    return

  addIngredient: (ingredient) ->
    ingredientTileView = new Dindin.Views.IngredientTile({
      model: ingredient
    });
    this.addSubview('.ingredient-list', ingredientTileView);
    ingredientTileView.render();

  events: {
    'dblclick .ingredient-list li': 'selectIngredient',
    'dblclick .selected-ingredients li': 'unSelectIngredient',
    'keyup #ingredient-search': 'filterIngredients',
    # 'click button': 'openModal'
  },

  filterIngredients: (event) ->
    event.preventDefault()
    this.removeSubviews('.ingredient-list')
    letters = $(event.currentTarget).val()
    matches = []
    matches = this.collection.search(letters)
    matches.each(this.addIngredient.bind(this))
    this.toggleAddNew();
    this.renderSubviews()

  # openModal: ->
  #   debugger
  #   $('.new-ingredient-modal').modal('show')

  template: JST['ingredients/_selector']

  render: ->
    renderedContent = this.template({
      ingredients: this.collection
    })
    this.$el.html(renderedContent)
    this.renderSubviews()
    this.setSortable()
    this

  resetSearch: ->
    this.$el.find('#ingredient-search').val('')
    this.removeSubviews('.ingredient-list')
    this.collection.reset(this.collection.shuffle(), {silent:true});
    this.collection.each(this.addIngredient.bind(this))
    this.renderSubviews()

  selectIngredient: (event) ->
    event.preventDefault()
    content = $(event.currentTarget)
    id = content.data('id')
    $('.selected-ingredients').append(content)
    this.selectedIds.push(id)
    $('.selected-ingredients').trigger("ingredientSelected", { ids: this.selectedIds })

  setSortable: ->
    this.$el.find('.ing-sort').sortable({
      axis: 'x,y',
      connectWith: '.ing-sort',
    })

  toggleAddNew: ->
    el = this.$el.find('#add-new-ingredient')
    if this.subviews()['.ingredient-list'].length == 0
      newPrompt = new Dindin.Views.IngredientNew({
        text: $('#ingredient-search').val()
      })
      this.addSubview('.ingredient-list', newPrompt)

  toggleSelected: (el) ->
    id = el.data('id')
    if !el.data('selected')
      el.data('selected', true);
      selectedSubview = _.find(this.subviews()['.ingredient-list'], (subview) -> 
        return subview.attributes()['data-id'] == id 
      )
      subviewIndex = this.subviews()['.ingredient-list'].indexOf(selectedSubview)
      this.subviews()['.ingredient-list'].splice(subviewIndex, 1)
      this.addSubview('.selected-ingredients', selectedSubview);
      this.selectedIds.push(id);
      this.resetSearch();
    else 
      el.data('selected', false);
      selectedSubview = _.find(this.subviews()['.selected-ingredients'], (subview) -> 
        return subview.attributes()['data-id'] == id 
      )
      this.removeSubview('.selected-ingredients', selectedSubview);
      idIndex = this.selectedIds.indexOf(id)
      this.selectedIds.splice(idIndex, 1)

  unSelectIngredient: (event) ->
    event.preventDefault
    content = $(event.currentTarget)
    id = content.data('id')
    $('.ingredient-list').append(content)
    idIndex = this.selectedIds.indexOf(id)
    this.selectedIds.splice(idIndex, 1)
})