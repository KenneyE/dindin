Dindin.Models.Recipe = Backbone.Model.extend({
  ingredients: function(){
    this._ingredients = this._ingredients ||
      new Dindin.Collections.RecipeIngredients([], { recipe: this });
      return this._ingredients
  },

  parse: function(resp){
    if (resp.ingredients){
      this.ingredients().set(resp.ingredients, { parse: true });
      delete resp.ingredients;
    }

    return resp;
  },

  urlRoot: '/api/recipes',
})