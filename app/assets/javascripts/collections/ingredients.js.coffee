Dindin.Collections.Ingredients = Backbone.Collection.extend({
  byCategory: (category) -> 
    filtered = this.filter (ingredient) -> 
      ingredient.get('category') == category;
    new Dindin.Collections.Ingredients(filtered);

  getOrFetchById: (id) -> 
    recipes = this
    model = this.get('id')

    if model 
      model.fetch()
    else 
      model = new Dindin.Models.Recipe({id: id});
      model.fetch({
        success: ->
          recipes.add(model)
      })
    model

  model: Dindin.Models.Ingredient,

  search: (letters) ->
    return this if letters == ''

    pattern = new RegExp('^.*' + letters + '.*$', 'i')
    _(this.filter (ingredient) -> 
      pattern.test(ingredient.get('name'))
    )

  url: 'api/ingredients',
})

Dindin.Collections.ingredients = new Dindin.Collections.Ingredients()