Dindin.Collections.Ingredients = Backbone.Collection.extend({
  byCategory: function(category){
    var filtered = this.filter(function(ingredient){
      return ingredient.get('category') === category;
    })
    return new Dindin.Collections.Ingredients(filtered);
  },

  getOrFetchById: function(id){
    var recipes = this;
    var model = this.get('id');

    if (model) {
      model.fetch();
    } else {
      model = new Dindin.Models.Recipe({id: id});
      model.fetch({
        success: function(){
          recipes.add(model);
        }
      });
    }
    return model;
  },

  model: Dindin.Models.Ingredient,

  url: 'api/ingredients',
})

Dindin.Collections.ingredients = new Dindin.Collections.Ingredients();