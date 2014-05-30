Dindin.Views.IngredientSelector = Backbone.CompositeView.extend({
  initialize: (options) ->
    this.formElSelector = options.formElSelector
    this.collection = Dindin.Collections.ingredients
    this.collection.each(this.addIngredient.bind(this))
    this.listenTo(this.collection, 'add', this.addIngredient)
    this.listenTo(this.collection, 'sync', this.render)
    newPrompt = new Dindin.Views.IngredientNew({
        text: $('#ingredient-search').val()
      })
    $('body').prepend(newPrompt.render().$el)
    this.selectedIds = []
    return

  addIngredient: (ingredient) ->
    ingredientTileView = new Dindin.Views.IngredientTile({
      model: ingredient
    })
    this.addSubview('.ingredient-list', ingredientTileView)
    ingredientTileView.render()

  events: {
    'dblclick .ingredient-list li': 'selectIngredient',
    'dblclick .selected-ingredients li': 'unSelectIngredient',
    'keyup #ingredient-search': 'filterIngredients',
    'click .input-group button': 'openModal'
  },

  filterIngredients: (event) ->
    event.preventDefault()
    this.removeSubviews('.ingredient-list')
    letters = $(event.currentTarget).val()
    matches = []
    matches = this.collection.search(letters)
    matches.each(this.addIngredient.bind(this))
    this.renderSubviews()
    this.toggleNewPrompt()

  openModal: (event) ->
    event.preventDefault()
    $('#new-ingredient-modal').modal('show')
    $('input#ingredient-name').val($('#ingredient-search').val())
    return

  template: JST['ingredients/_selector']

  removeSubviewByDataId: (id, selector) ->
    selectedSubview = _.find(this.subviews()[selector], (subview) -> 
      return subview.attributes()['data-id'] == id 
      )
    this.removeSubview(selector, selectedSubview);
    idIndex = this.selectedIds.indexOf(id)
    this.selectedIds.splice(idIndex, 1)


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
    $('.selected-ingredients').prepend(content)
    this.toggleSelected(content)
    $('.selected-ingredients').trigger("ingredientSelected", { ids: this.selectedIds })

  setSortable: ->
    this.$el.find('.ing-sort').sortable({
      axis: 'x,y',
      connectWith: '.ing-sort',
      cancel: '.no-drag',
      remove: (event, ui) =>
        # if $(ui.item).parent().attr('id') == "fridge-ingredients"
        #   id = ui.item.data('id')
        #   @removeSubviewByDataId(id, '.ingredient-list')
    })

  toggleNewPrompt: ->
    if this.subviews()['.ingredient-list'].length == 0
      content = $('#ingredient-search').val()
      $('.ingredient-list').append("<h5 class='no-drag'>No matched ingredients. 
        Click 'add new ingredient' to add a new one.</h5>")

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
      this.removeSubviewByDataId(id, '.selected-ingredients')

  unSelectIngredient: (event) ->
    event.preventDefault()
    content = $(event.currentTarget)
    $('.ingredient-list').prepend(content)
    this.toggleSelected(content)
})