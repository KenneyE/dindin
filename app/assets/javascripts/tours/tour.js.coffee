searchTour = Dindin.Tours.searchTour = new Shepherd.Tour({
  defaults:
    classes: 'shepherd-theme-arrows'
  })

searchTour.addStep 'intro',
  text: 'Hello! Welcome to Dindin!'
  buttons: [
    text: 'Next'
    action: searchTour.next
  ]

searchTour.addStep 'ingredientList',
  text: 'Recipe ingredients are represented by multicolored tiles.'
  attachTo: '.ingredient-list left'
  buttons: [
    text: 'Next'
    action: searchTour.next
  ] 

searchTour.addStep 'ingredientSearch',
  text: "You can search for ingredients by typing a name here.<br> If you don't find what you're looking for, <br>you can click the 'add new ingredient' button to add it."
  attachTo: '#ingredient-search left'
  buttons: [
    text: 'Next'
    action: searchTour.next
  ]

searchTour.addStep 'selectedIngredients',
  text: 'Try dragging and dropping an ingredient into the search selector.'
  attachTo: '.selected-ingredients top'
  buttons: [
    text: 'Next'
    action: searchTour.next
  ] 
  advanceOn: '.selected-ingredients ingredientSelected'

searchTour.addStep 'recipeMatches',
  text: 'Recipes that match the ingredients appear here.<br> Notice that the ingredient list appears on the back of the tile!'
  attachTo: '.recipe-tile right'
  buttons: [
    text: 'Next'
    action: searchTour.next
  ]