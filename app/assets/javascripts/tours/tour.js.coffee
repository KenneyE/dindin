searchTour = Dindin.Tours.searchTour = new Shepherd.Tour({
  defaults:
    classes: 'shepherd-theme-arrows'
  })

searchTour.addStep 'intro',
  title: 'Welcome to Din Din'
  text: [
    'Hello! Welcome to Din Din!',
    'This tour is designed to show you around the features of the app.',
    'Feel free to click the "x" in th corner at any time to stop the tour and explore on your own.'
  ]
  showCancelLink: true
  buttons: [{
    text: 'Back'
    action: searchTour.back},
    {text: 'Next'
    action: searchTour.next}
  ]

searchTour.addStep 'ingredientList',
  title: 'Ingredient Tiles'
  text: 'Recipe ingredients are represented by multicolored tiles.'
  showCancelLink: true
  attachTo: '.ingredient-list left'
  buttons: [{
    text: 'Back'
    action: searchTour.back },
    { text: 'Next'
    action: searchTour.next }
  ]

searchTour.addStep 'ingredientSearch',
  title: 'Search for and Add Ingredients'
  text: [
    'You can narrow down the list of ingredients by typing a name here.', 
    "The list will sort while you type. If you don't find what you're looking for,<br> 
    you can click the 'add new ingredient' button to add it."
  ]
  showCancelLink: true
  attachTo: '#ingredient-search left'
  buttons: [{
    text: 'Back'
    action: searchTour.back },
    { text: 'Next'
    action: searchTour.next }
  ]

searchTour.addStep 'selectedIngredients',
  title: 'Search for Recipes by Ingredient'
  text: 'Try dragging and dropping an ingredient into the search selector.'
  showCancelLink: true
  attachTo: '.selected-ingredients bottom'
  advanceOn: { selector: '.selected-ingredients', event: 'ingredientSelected' }
  buttons: [ {
    text: 'Back'
    action: searchTour.back },
    { text: 'Next'
    action: searchTour.next }
  ]

searchTour.addStep 'recipeMatches',
  title: 'Matching Recipes'
  text: [
    'Recipes that match the ingredients appear here.',
    'Now on to what makes Din Din special...']
  showCancelLink: true
  attachTo: '.recipe-matches right'
  buttons: [{
    text: 'Back'
    action: searchTour.back },
    { text: 'Next'
    action: searchTour.next }
  ]


searchTour.addStep 'fridgeIntro',
  title: 'The Fridge'
  text: 'The Fridge! Try hovering your mouse over the edge of the fridge.'
  showCancelLink: true
  attachTo: '#user-menu right'
  advanceOn: { selector: '#user-menu', event: 'mouseover' }
  buttons: [{
    text: 'Back'
    action: searchTour.back },
    { text: 'Next'
    action: searchTour.next }
  ]


searchTour.addStep 'fridgeOpen',
  title: 'Open Your Fridge'
  text: [
    'Your fridge is where you can store ingredients that you actually have on hand.',
    'You can drag and drop ingredients from here into the search field too.'
  ]
  attachTo: '#user-menu right'
  buttons: [{
    text: 'Back'
    action: searchTour.back },
    { text: 'Next'
    action: searchTour.next }
  ]

searchTour.addStep 'recipeIngredients',
  title: "Find Out What You'll Need"
  text: [
    'When you hover over a recipe tile, ingredient list appears on the back!',
    'If you have ingredients stored in your fridge, the ingredient list will <br>
    be sorted by what you have and what you still need to buy.',
    'Now lets try clicking on a recipe!'
  ]
  attachTo: '.recipe-matches right'
