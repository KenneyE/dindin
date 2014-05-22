Dindin.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "recipesIndex",
    "recipes/new": "recipeNew",
    "recipes/:id": "recipeShow",
    "ingredients/new": "ingredientNew",
  },

  ingredientNew: function(){
    Dindin.Collections.ingredients.fetch();
    var ingredientNewView = new Dindin.Views.IngredientNew({
      collection: Dindin.Collections.ingredients
    })
    this._swapView(ingredientNewView);
  },

  recipesIndex: function(){
    Dindin.Collections.recipes.fetch();
    var recipesIndexView = new Dindin.Views.RecipesIndex({
      collection: Dindin.Collections.recipes
    })
    this._swapView(recipesIndexView);
  },

  recipeNew: function(){
    var recipe = new Dindin.Models.Recipe();
    var recipeNewView = new Dindin.Views.RecipeNew({
      model: recipe
    })
    this._swapView(recipeNewView);
  },

  recipeShow: function(id){
    Dindin.Collections.recipes.fetch();
    var recipe = Dindin.Collections.recipes.getOrFetchById(id);
    var recipeShowView = new Dindin.Views.RecipeShow({
      model: recipe
    })
    this._swapView(recipeShowView);
  },

  _swapView: function(newView){
    if(this.currentView){
      this.currentView.remove();
    }
    $('#content').html(newView.render().$el);
    this.currentView = newView;
  },
})