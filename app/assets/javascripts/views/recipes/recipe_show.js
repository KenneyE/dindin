Dindin.Views.RecipeShow = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model, 'sync', this.render);
    this.ingredients = this.model.ingredients() || [];
    // this.listenTo(this.ingredients(), 'sync', this.render);
  },

  className: 'col-md-8 col-md-offset-2 recipe recipe-show',

  template: JST['recipes/show'],

  render: function(){
    var renderedContent = this.template({
      recipe: this.model,
      ingredients: this.ingredients
    })

    this.$el.html(renderedContent);
    return this;
  },
})