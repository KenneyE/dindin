Dindin.Views.RecipesSearch = Backbone.CompositeView.extend({
  initialize: function(){
    this.collection = new Dindin.Collections.Recipes();
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
    // 'submit #recipe-search-form': 'search',
  },

  template: JST['recipes/search'],

  render: function(){
    renderedContent = this.template();
    this.$el.html(renderedContent);
    this.renderSubviews();
    this.setSortable();
    return this;
  },

  setSortable: function(){
    var that = this;
    this.$el.find('.ing-sort').sortable({
      axis: 'x,y',
      connectWith: '.ing-sort',
      update: function(event){
        var ingredientIds = $('.selected-ingredients')
          .sortable('toArray', { attribute: 'data-id'} );
        that.searchByIds(ingredientIds);
      },
    })
  },

  searchByIds: function(ids){
    var formData = {
      'recipe': {
        'ingredient_ids': ids,
      },
    }
    this.collection.reset();
    this.collection.fetch({
      data: $.param(formData),
      add: true,
    });
  },
})