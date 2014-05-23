Dindin.Views.IngredientSelector = Backbone.CompositeView.extend({
  initialize: function(options){
    this.formElSelector = options.formElSelector;
    Dindin.Collections.ingredients.fetch();
    this.collection = Dindin.Collections.ingredients;
    this.collection.each(this.addIngredient.bind(this));
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addIngredient);
  },

  addIngredient: function(ingredient){
    var ingredientTileView = new Dindin.Views.IngredientTile({
      model: ingredient
    });
    var catSelector = '.' + ingredient.get('category') + '-list'

    this.addSubview(catSelector, ingredientTileView);
    ingredientTileView.render();
  },

  events: {
    'click #ingredient-tabs a': 'showTab',
    'click .ingredient-list li': 'selectIngredient',
    'click #selected-ingredients li': 'unSelectIngredient',
  },

  template: JST['ingredients/_selector'],

  render: function(){
    var renderedContent = this.template({
      proteins: this.collection.byCategory('Protein'),
      vegetables: this.collection.byCategory('Vegetables'),
      fruits: this.collection.byCategory('Fruit'),
      dairy: this.collection.byCategory('Dairy')
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
    var category = content.data('category');
    var selector = '.' + category + '-list';
    $(selector).append(content);
    $("a[data-category='" + category + "']").tab('show');
    var $inputToRemove = $(this.formElSelector).find("input[value='" + id + "']");
    $inputToRemove.remove();
  },

  showTab: function(event){
    event.preventDefault();
    $(event.target).tab('show');
  },
})