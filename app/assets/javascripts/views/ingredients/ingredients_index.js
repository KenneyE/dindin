Dindin.Views.IngredientsIndex = Backbone.CompositeView.extend({
  initialize: function(){
    this.listenTo(this.collection, 'sync', this.render);
    var ingredientSelector = new Dindin.Views.IngredientSelector({
      collection: this.collection
    })
    this.addSubview('.ingredient-selector-box', ingredientSelector);
  },

  className: 'col-md-10 col-md-offset-1 recipe',

  template: JST['ingredients/index'],

  render: function(){
    var renderedContent = this.template({});
    this.$el.html(renderedContent);
    this.renderSubviews();
    return this;
  },
})