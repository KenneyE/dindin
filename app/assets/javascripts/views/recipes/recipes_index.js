Dindin.Views.RecipesIndex = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, 'sync', this.render)
  },

  className: 'col-md-10 col-md-offset-1 recipe',

  template: JST['recipes/index'],

  render: function(){
    var renderedContent = this.template({
      recipes: this.collection
    })
    this.$el.html(renderedContent);
    return this;
  }
})