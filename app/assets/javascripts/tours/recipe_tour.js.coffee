recipeTour = Dindin.Tours.recipeTour = new Shepherd.Tour({
  defaults:
    classes: 'shepherd-theme-arrows'
  })

recipeTour.addStep 'intro',
  title: 'Recipe Page'
  text: 'This is a recipe page.'
  showCancelLink: true
  buttons: [
    {text: 'Next'
    action: recipeTour.next}
  ]

recipeTour.addStep 'ingredients',
  title: 'Ingredient List'
  text: [
    'Ingredients are sorted by what you currently have in your fridge',
    'and what you would need to buy.'
  ]
  showCancelLink: true
  attachTo: '.col-md-4 right'
  buttons: [{
    text: 'Back'
    action: recipeTour.back },
    { text: 'Next'
    action: recipeTour.next }
  ]

recipeTour.addStep 'favoriting',
  title: 'Add to Favorites'
  text: 'You can add or remove a recipe from your favorites by clicking on the heart.'
  showCancelLink: true
  attachTo: '.favorite-button right'
  buttons: [{
    text: 'Back'
    action: recipeTour.back },
    { text: 'Next'
    action: recipeTour.next }
  ]

recipeTour.addStep 'getInstructions',
  title: 'Get the Full instructions'
  text: [
    'You can click the link to view the full instructions for the recipe',
    "on the content author's site."
  ]
  showCancelLink: true
  attachTo: '#source-link top'
  buttons: []