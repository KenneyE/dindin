Dindin.Collections.Recipes = Backbone.Collection.extend({
  getOrFetchById: (id) ->
    recipes = this
    model = this.get('id')

    if model 
      model.fetch()
    else 
      model = new Dindin.Models.Recipe({id: id});
      model.fetch({
        success: ->
          recipes.add(model);
      })
    model

  model: Dindin.Models.Recipe,

  url: '/api/recipes',
})

Dindin.Collections.recipes = new Dindin.Collections.Recipes()