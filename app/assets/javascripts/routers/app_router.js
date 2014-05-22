Dindin.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "recipesIndex",
    "recipes/:id": "recipeShow"
  },

  recipesIndex: function(){
    alert('fired');
    Dindin.Collections.recipes.fetch();
    var recipesIndexView = new Dindin.Views.RecipesIndex({
      collection: Dindin.Collections.recipes
    })
    this._swapView(recipesIndexView);
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