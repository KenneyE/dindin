Dindin.Views.IngredientSelector = Backbone.CompositeView.extend({
  initialize: function(options){
    this.formElSelector = options.formElSelector;
    this.collection = Dindin.Collections.ingredients;
    this.collection.fetch();
    this.collection.each(this.addIngredient.bind(this));
    this.listenTo(this.collection, 'add', this.addIngredient)
    this.listenTo(this.collection, 'sync', this.render);
    this.selectedIds = [];
  },

  addIngredient: function(ingredient){
    var ingredientTileView = new Dindin.Views.IngredientTile({
      model: ingredient
    });
    this.addSubview('.ingredient-list', ingredientTileView);
    ingredientTileView.render();
  },

  events: {
    'dblclick .ingredient-list li': 'selectIngredient',
    'dblclick .selected-ingredients li': 'unSelectIngredient',
    'keyup #ingredient-search': 'filterIngredients',
  },

  filterIngredients: function(event){
    event.preventDefault();
    this.removeSubviews('.ingredient-list');
    var letters = $(event.currentTarget).val();
    var matches = [];
    matches = this.collection.search(letters);
    matches.each(this.addIngredient.bind(this));
    this.renderSubviews();
  },

  template: JST['ingredients/_selector'],

  render: function(){
    var renderedContent = this.template({
      ingredients: this.collection
    })

    this.$el.html(renderedContent);
    this.renderSubviews();
    this.setSortable();
    return this;
  },

  resetSearch: function(){
    this.$el.find('#ingredient-search').val();
    this.removeSubviews('.ingredient-list');
    this.collection.reset(this.collection.shuffle(), {silent:true}); 
    this.collection.each(this.addIngredient.bind(this));
    this.renderSubviews();
  },

  selectIngredient: function(event){
    event.preventDefault();
    var content = $(event.currentTarget);
    var id = content.data('id');
    $('.selected-ingredients').append(content);
    this.selectedIds.push(id);
    $('.selected-ingredients').trigger("ingredientSelected", { ids: this.selectedIds })
  },

  setSortable: function(){
    var that = this;
    this.$el.find('.ing-sort').sortable({
      axis: 'x,y',
      connectWith: '.ing-sort',
    })
  },

  toggleSelected: function(el){
    var id = el.data('id');
    if (!el.data('selected')) {
      el.data('selected', true);
      var selectedSubview = _.find(this.subviews()['.ingredient-list'], function(subview){ 
        return subview.attributes()['data-id'] === id 
      })
      var subviewIndex = this.subviews()['.ingredient-list'].indexOf(selectedSubview)
      this.subviews()['.ingredient-list'].splice(subviewIndex, 1)
      this.addSubview('.selected-ingredients', selectedSubview);
      this.selectedIds.push(id);
      this.resetSearch();
    } else {
      el.data('selected', false);
      var selectedSubview = _.find(this.subviews()['.selected-ingredients'], function(subview){ 
        return subview.attributes()['data-id'] === id 
      })
      this.removeSubview('.selected-ingredients', selectedSubview);
      var idIndex = this.selectedIds.indexOf(id);
      this.selectedIds.splice(idIndex, 1);   
    }
  },

  unSelectIngredient: function(event){
    event.preventDefault;
    var content = $(event.currentTarget);
    var id = content.data('id');
    $('.ingredient-list').append(content);
    var idIndex = this.selectedIds.indexOf(id);
    this.selectedIds.splice(idIndex, 1);
  },
})