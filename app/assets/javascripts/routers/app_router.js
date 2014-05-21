Dindin.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "RecipesIndex",
  },

  RecipesIndex: function(){
    Dindin.Collections.recipes.fetch();
    var recipesIndexView = new Dindin.Views.RecipesIndex({
      collection: Dindin.Collections.recipes
    })
    this._swapView(recipesIndexView);
  },

  _swapView: function(newView){
    if(this.currentView){
      this.currentView.remove();
    }
    $('#content').html(newView.render().$el);
    this.currentView = newView;
  },
})