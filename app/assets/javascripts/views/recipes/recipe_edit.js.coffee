Dindin.Views.RecipeEdit = Backbone.CompositeView.extend({
  initialize: ->
    this.listenTo(this.model, 'sync', this.render)
    ingredientSelector = new Dindin.Views.IngredientSelector({
      formElSelector: '#new-recipe-form'
      })
    this.addSubview('.ingredient-selector-box', ingredientSelector)
    return

  className: 'col-md-6 col-md-offset-3 recipe'

  events: {
    'submit #new-recipe-form': 'editRecipe',
    'change #recipe-image': 'handlePhoto',
  },

  template: JST['recipes/edit'],

  render: ->
    renderedContent = this.template({
      recipe: this.model
    })
    this.$el.html(renderedContent)
    this.renderSubviews()
    this

  editRecipe: (event) ->
    event.preventDefault()
    recipe = this.model
    formData = $(event.target).serializeJSON()
    debugger
    formData.recipe.image = this.photoFile if this.photoFile
    recipe.save(formData.recipe, {
      patch: true,
      success: ->
        Dindin.Collections.recipes.fetch()
        Backbone.history.navigate('/recipes/' + recipe.id, { trigger: true })
        return
    })
    return

  handlePhoto: (event) ->
    that = this
    file = $(event.target)[0].files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      that.photoFile = e.target.result
      return
    reader.readAsDataURL(file)
    return
})