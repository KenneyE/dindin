Dindin.Views.IngredientNew = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, 'sync', this.render);
  },

  events: {
    'click #ingredient-tabs a': 'showTab',
    'click .ingredient-select': 'selectIngredient',
    'click #selected-ingredients button': 'unSelectIngredient',
  },

  template: JST['ingredients/_new'],

  render: function(){
    var renderedContent = this.template({
      proteins: this.collection.byCategory('Protein'),
      vegetables: this.collection.byCategory('Vegetables'),
      fruits: this.collection.byCategory('Fruit'),
      dairy: this.collection.byCategory('Dairy')
    })

    this.$el.html(renderedContent);
    return this;
  },

  selectIngredient: function(event){
    event.preventDefault();
    var content = $(event.target);
    var id = content.data('id');
    $('#selected-ingredients').append(content);
    $('#new-recipe-form').prepend("<input type='hidden' name='recipe[ingredient_ids][]' value='" + id + "'>");
  },

  unSelectIngredient: function(event){
    event.preventDefault;
    var content = $(event.target);
    var id = content.data('id');
    var category = $(event.target).data('category');
    $(category).append(content);
    $("a[data-category='" + category + "']").tab('show');
    var $inputToRemove = $('#new-recipe-form').find("input[value='" + id + "']");
    $inputToRemove.remove();
  },

  showTab: function(event){
    event.preventDefault();
    $(event.target).tab('show');
  },
})