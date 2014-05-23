Dindin.Views.RecipesSearch = Backbone.CompositeView.extend({
  initialize: function(){
    this.listenTo(this.collection, 'add', this.addRecipe);
    this.listenTo(this.collection, 'sync add', this.render);
    var ingredientSelector = new Dindin.Views.IngredientSelector({
      formElSelector: '#recipe-search-form'
    });
    this.addSubview('.ingredient-selector-box', ingredientSelector);
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

  events: {
    'submit #recipe-search-form': 'search',
  },

  template: JST['recipes/search'],

  render: function(){
    renderedContent = this.template({
      recipes: this.collection
    })
    this.$el.html(renderedContent);
    this.renderSubviews();
    return this;
  },

  search: function(event){
    event.preventDefault();
    var formData = $(event.target).serializeJSON().recipe;
    this.collection.fetch({
      data: $.param(formData),
      reset: true,
    });
  },
})