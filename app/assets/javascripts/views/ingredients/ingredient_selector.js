Dindin.Views.IngredientSelector = Backbone.CompositeView.extend({
  initialize: function(options){
    this.formElSelector = options.formElSelector;
    this.collection = Dindin.Collections.ingredients;
    Dindin.Collections.ingredients.fetch();
    this.listenTo(this.collection, 'sync', this.render);
  },

  addIngredient: function(ingredient){
    var ingredientTileView = new Dindin.Views.IngredientTile({
      model: ingredient
    });
    this.addSubview('.ingredient-list', ingredientTileView);
    ingredientTileView.render();
  },

  events: {
    'click .ingredient-list li': 'selectIngredient',
    'click #selected-ingredients li': 'unSelectIngredient',
    'keyup #ingredient-search': 'filterIngredients',
  },

  filterIngredients: function(event){
    event.preventDefault();
    this.removeSubviews();
    var letters = $(event.currentTarget).val();
    var matches = [];
    matches = this.collection.search(letters);
    matches.each(this.addIngredient.bind(this));
    this.renderSubviews();
  },

  template: JST['ingredients/_selector'],

  removeSubviews: function(){
    _(this.subviews()['.ingredient-list']).each(function(subview){
      subview.remove();
    });
    this.subviews()['.ingredient-list'] = [];
  },

  render: function(){
    var renderedContent = this.template({
      ingredients: this.collection
    })

    this.$el.html(renderedContent);
    this.renderSubviews();
    return this;
  },

  selectIngredient: function(event){
    event.preventDefault();
    var content = $(event.currentTarget);
    var id = content.data('id');
    $('#selected-ingredients').append(content);
    $(this.formElSelector).prepend("<input type='hidden' name='recipe[ingredient_ids][]' value='" + id + "'>");
  },

  unSelectIngredient: function(event){
    event.preventDefault;
    var content = $(event.currentTarget);
    var id = content.data('id');
    $('.ingredient-list').append(content);
    var $inputToRemove = $(this.formElSelector).find("input[value='" + id + "']");
    $inputToRemove.remove();
  },

  showTab: function(event){
    event.preventDefault();
    $(event.target).tab('show');
  },
})