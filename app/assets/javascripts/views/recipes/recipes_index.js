Dindin.Views.RecipesIndex = Backbone.CompositeView.extend({
  initialize: function(){
    this.listenTo(this.collection, 'add', this.addRecipe);
    this.listenTo(this.collection, 'sync add', this.render);
    this.collection.each(this.addRecipe.bind(this));
  },

  addRecipe: function(recipe){
    var recipeTileView = new Dindin.Views.RecipeTile({
      model: recipe
    });

    this.addSubview('.recipe-list', recipeTileView);
    recipeTileView.render();
  },

  className: 'col-md-10 col-md-offset-1 recipe',

  template: JST['recipes/index'],

  render: function(){
    var renderedContent = this.template({
      recipes: this.collection
    })
    this.$el.html(renderedContent);
    this.renderSubviews();
    return this;
  }
})