Dindin.Views.RecipesSearch = Backbone.CompositeView.extend({
  initialize: function(){
    this.collection = new Dindin.Collections.SearchedRecipes();
    this.ingredientSelector = new Dindin.Views.IngredientSelector({
      formElSelector: '#recipe-search-form'
    });
    var recipeMatches = new Dindin.Views.RecipeMatches({
      collection: this.collection
    });
    this.addSubview('.recipe-matches', recipeMatches);
    this.addSubview('.ingredient-selector-box', this.ingredientSelector);
  },

  className: 'col-md-12 recipe',

  events: {
    'ingredientSelected .selected-ingredients': 'handleSelect'
  },

  handleSelect: function (event, data) {
    this.searchByIds(data.ids);
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
      update: function(event, ui){
        var ingredientIds = $('.selected-ingredients')
          .sortable('toArray', { attribute: 'data-id'} );
        that.ingredientSelector.toggleSelected(ui.item);
        that.searchByIds(ingredientIds);
      },
    })
  },

  searchByIds: function(ids){
    this.collection.reset();
    if (ids.length > 0) {
      var formData = {
        'ingredient_ids': ids,
      }

      this.collection.fetch({
        data: $.param(formData),
        add: true,
      });
    }
  },
})