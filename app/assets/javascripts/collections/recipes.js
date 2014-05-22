Dindin.Collections.Recipes = Backbone.Collection.extend({
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

  model: Dindin.Models.Recipe,

  url: '/api/recipes',
})

Dindin.Collections.recipes = new Dindin.Collections.Recipes();