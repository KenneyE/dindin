# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
5.times do |n|
  User.create(email: "test#{n}@test.com", username: "user#{n}", 
    password: "password", password_confirmation: "password")
end

# Ingredients

# vegetables = { category: 'Vegetables',
#                ingredients: %w( potatoes asparagus tomatoes broccoli cauliflower brussels\ sprouts bok\ choy
#                             onions bell\ peppers jalapeno\ peppers lettuce cabbage endive radicchio green\ onions chives
#                             kale swiss\ chard mustard\ greens garlic beets radishes carrots peas cucumbers zucchini fava\ beans
#                             shallots turnips rutabaga summer\ squash acorn\ squash artichoke avocado parsnips rhubarb sauerkraut
#                             kimchi vegetable\ stock okra)
# }

# fruit = { category: 'Fruit',
#           ingredients:  %w( apples oranges pears grapes lemons limes kumquats raisins apricots peaches nectarines
#                         yuzu mangoes passion\ fruit star\ fruit durian guava bananas raspberries blueberries blackberries cherries
#                         kiwis plantains tangerines strawberries )
# }

# protein = { category: 'Protein',
#             ingredients: %w( chicken\ wings chicken\ legs chicken\ breast chicken\ thighs whole\ chicken steak pork pork\ chops
#                          lamb lamb\ shanks tofu trout bass tuna salmon whole\ turkey flounder catfish rabbit duck goose ground\ beef 
#                          filet\ mignon ribeye\ steaks t-bone\ steaks porterhouse\ steaks pork\ ribs pork\ shank beef\ cheeks turkey\ legs
#                          turkey\ breast bratwurst hot\ dogs keilbasa bacon prosciutto ham lamb\ sausage pork\ sausage pork\ belly 
#                          chicken\ stock pork\ stock fish\ stock beef\ stock)
# }

# dairy = { category: 'Dairy',
#           ingredients: %w( milk heavy\ cream half\ and\ half cheddar\ cheese swiss\ cheese blue\ cheese gorgonzola\cheese eggs 
#                        duck\ eggs goat\ milk goat\ cheese buttermilk )
# }

# grains = { category: 'Grains & Legumes',
#            ingredients: %w( baguette whole\ wheat\ bread white\ bread macaroni spaghetti penne\ pasta flour brown\ rice white\ rice
#                         basmati\ rice farro barley arborio\ rice country\ bread bow\ tie\ pasta black\ beans navy\ beans quinoa kidney\ beans
#                         red\ lentils yellow\ lentils green\ lentils fava\ beans canellini\ beans )
# }

# [vegetables, fruit, protein, dairy, grains].each do |category|
#   category[:ingredients].each do |ingredient|
#     Ingredient.create(name: ingredient, category: category[:category])
#   end
# end

Ingredient.create!([
  {name: "potatoes", category: "Vegetables"},
  {name: "asparagus", category: "Vegetables"},
  {name: "tomatoes", category: "Vegetables"},
  {name: "broccoli", category: "Vegetables"},
  {name: "cauliflower", category: "Vegetables"},
  {name: "brussels sprouts", category: "Vegetables"},
  {name: "bok choy", category: "Vegetables"},
  {name: "onions", category: "Vegetables"},
  {name: "bell peppers", category: "Vegetables"},
  {name: "jalapeno peppers", category: "Vegetables"},
  {name: "lettuce", category: "Vegetables"},
  {name: "cabbage", category: "Vegetables"},
  {name: "endive", category: "Vegetables"},
  {name: "radicchio", category: "Vegetables"},
  {name: "green onions", category: "Vegetables"},
  {name: "chives", category: "Vegetables"},
  {name: "kale", category: "Vegetables"},
  {name: "swiss chard", category: "Vegetables"},
  {name: "mustard greens", category: "Vegetables"},
  {name: "garlic", category: "Vegetables"},
  {name: "beets", category: "Vegetables"},
  {name: "radishes", category: "Vegetables"},
  {name: "carrots", category: "Vegetables"},
  {name: "peas", category: "Vegetables"},
  {name: "cucumbers", category: "Vegetables"},
  {name: "zucchini", category: "Vegetables"},
  {name: "fava beans", category: "Vegetables"},
  {name: "shallots", category: "Vegetables"},
  {name: "turnips", category: "Vegetables"},
  {name: "rutabaga", category: "Vegetables"},
  {name: "summer squash", category: "Vegetables"},
  {name: "acorn squash", category: "Vegetables"},
  {name: "artichoke", category: "Vegetables"},
  {name: "avocado", category: "Vegetables"},
  {name: "parsnips", category: "Vegetables"},
  {name: "rhubarb", category: "Vegetables"},
  {name: "sauerkraut", category: "Vegetables"},
  {name: "kimchi", category: "Vegetables"},
  {name: "vegetable stock", category: "Vegetables"},
  {name: "okra", category: "Vegetables"},
  {name: "apples", category: "Fruit"},
  {name: "oranges", category: "Fruit"},
  {name: "pears", category: "Fruit"},
  {name: "grapes", category: "Fruit"},
  {name: "lemons", category: "Fruit"},
  {name: "limes", category: "Fruit"},
  {name: "kumquats", category: "Fruit"},
  {name: "raisins", category: "Fruit"},
  {name: "apricots", category: "Fruit"},
  {name: "peaches", category: "Fruit"},
  {name: "nectarines", category: "Fruit"},
  {name: "yuzu", category: "Fruit"},
  {name: "mangoes", category: "Fruit"},
  {name: "passion fruit", category: "Fruit"},
  {name: "star fruit", category: "Fruit"},
  {name: "durian", category: "Fruit"},
  {name: "guava", category: "Fruit"},
  {name: "bananas", category: "Fruit"},
  {name: "raspberries", category: "Fruit"},
  {name: "blueberries", category: "Fruit"},
  {name: "blackberries", category: "Fruit"},
  {name: "cherries", category: "Fruit"},
  {name: "kiwis", category: "Fruit"},
  {name: "plantains", category: "Fruit"},
  {name: "tangerines", category: "Fruit"},
  {name: "strawberries", category: "Fruit"},
  {name: "chicken wings", category: "Protein"},
  {name: "chicken legs", category: "Protein"},
  {name: "chicken breast", category: "Protein"},
  {name: "chicken thighs", category: "Protein"},
  {name: "whole chicken", category: "Protein"},
  {name: "steak", category: "Protein"},
  {name: "pork", category: "Protein"},
  {name: "pork chops", category: "Protein"},
  {name: "lamb", category: "Protein"},
  {name: "lamb shanks", category: "Protein"},
  {name: "tofu", category: "Protein"},
  {name: "trout", category: "Protein"},
  {name: "bass", category: "Protein"},
  {name: "tuna", category: "Protein"},
  {name: "salmon", category: "Protein"},
  {name: "whole turkey", category: "Protein"},
  {name: "flounder", category: "Protein"},
  {name: "catfish", category: "Protein"},
  {name: "rabbit", category: "Protein"},
  {name: "duck", category: "Protein"},
  {name: "goose", category: "Protein"},
  {name: "ground beef", category: "Protein"},
  {name: "filet mignon", category: "Protein"},
  {name: "ribeye steaks", category: "Protein"},
  {name: "t-bone steaks", category: "Protein"},
  {name: "porterhouse steaks", category: "Protein"},
  {name: "pork ribs", category: "Protein"},
  {name: "pork shank", category: "Protein"},
  {name: "beef cheeks", category: "Protein"},
  {name: "turkey legs", category: "Protein"},
  {name: "turkey breast", category: "Protein"},
  {name: "bratwurst", category: "Protein"},
  {name: "hot dogs", category: "Protein"},
  {name: "keilbasa", category: "Protein"},
  {name: "bacon", category: "Protein"},
  {name: "prosciutto", category: "Protein"},
  {name: "ham", category: "Protein"},
  {name: "lamb sausage", category: "Protein"},
  {name: "pork sausage", category: "Protein"},
  {name: "pork belly", category: "Protein"},
  {name: "chicken stock", category: "Protein"},
  {name: "pork stock", category: "Protein"},
  {name: "fish stock", category: "Protein"},
  {name: "beef stock", category: "Protein"},
  {name: "milk", category: "Dairy"},
  {name: "heavy cream", category: "Dairy"},
  {name: "half and half", category: "Dairy"},
  {name: "cheddar cheese", category: "Dairy"},
  {name: "swiss cheese", category: "Dairy"},
  {name: "blue cheese", category: "Dairy"},
  {name: "gorgonzola\\cheese", category: "Dairy"},
  {name: "eggs", category: "Dairy"},
  {name: "duck eggs", category: "Dairy"},
  {name: "goat milk", category: "Dairy"},
  {name: "goat cheese", category: "Dairy"},
  {name: "buttermilk", category: "Dairy"},
  {name: "baguette", category: "Grains & Legumes"},
  {name: "whole wheat bread", category: "Grains & Legumes"},
  {name: "white bread", category: "Grains & Legumes"},
  {name: "macaroni", category: "Grains & Legumes"},
  {name: "spaghetti", category: "Grains & Legumes"},
  {name: "penne pasta", category: "Grains & Legumes"},
  {name: "flour", category: "Grains & Legumes"},
  {name: "brown rice", category: "Grains & Legumes"},
  {name: "white rice", category: "Grains & Legumes"},
  {name: "basmati rice", category: "Grains & Legumes"},
  {name: "farro", category: "Grains & Legumes"},
  {name: "barley", category: "Grains & Legumes"},
  {name: "arborio rice", category: "Grains & Legumes"},
  {name: "country bread", category: "Grains & Legumes"},
  {name: "bow tie pasta", category: "Grains & Legumes"},
  {name: "black beans", category: "Grains & Legumes"},
  {name: "navy beans", category: "Grains & Legumes"},
  {name: "quinoa", category: "Grains & Legumes"},
  {name: "kidney beans", category: "Grains & Legumes"},
  {name: "red lentils", category: "Grains & Legumes"},
  {name: "yellow lentils", category: "Grains & Legumes"},
  {name: "green lentils", category: "Grains & Legumes"},
  {name: "canellini beans", category: "Grains & Legumes"},
  {name: "Yams", category: "Vegetables"},
  {name: "cayenne pepper", category: "Other"},
  {name: "curry powder", category: "Other"},
  {name: "bologna", category: "Protein"},
  {name: "kosher salt", category: "Other"},
  {name: "yogurt", category: "Dairy"},
  {name: "mozzarella cheese", category: "Dairy"},
  {name: "brown sugar", category: "Other"},
  {name: "sweet potatoes", category: "Vegetables"},
  {name: "baking chocolate", category: "Other"},
  {name: "chicken feet", category: "Protein"},
  {name: "basil", category: "Other"},
  {name: "bay leaf", category: "Other"},
  {name: "cinnamon", category: "Other"},
  {name: "sardines", category: "Protein"},
  {name: "dill pickles", category: "Vegetables"},
  {name: "pineapple", category: "Fruit"},
  {name: "salami", category: "Protein"},
  {name: "pepperoni", category: "Protein"},
  {name: "lobster", category: "Protein"},
  {name: "crab", category: "Protein"},
  {name: "butter", category: "Dairy"},
  {name: "paprika", category: "Other"},
  {name: "venison", category: "Protein"}
])
IngredientSave.create!([
  {user_id: 1, ingredient_id: 1},
  {user_id: 6, ingredient_id: 5},
  {user_id: 6, ingredient_id: 80},
  {user_id: 6, ingredient_id: 86},
  {user_id: 6, ingredient_id: 145},
  {user_id: 6, ingredient_id: 160},
  {user_id: 6, ingredient_id: 153},
  {user_id: 6, ingredient_id: 148},
  {user_id: 6, ingredient_id: 9}
])
Recipe.create!([
  {title: "Spring Asparagus Pancetta Hash", large_image_url: "http://lh3.ggpht.com/5dIkCacTRkSyfkR5qEdBhbXPNJJeeYJO476Pp8g5DTfCKjz9OiePyog1dKXP2jCpZfbdfyB1kZmWSonYRSDuEA=s360", small_image_url: "http://lh3.ggpht.com/5dIkCacTRkSyfkR5qEdBhbXPNJJeeYJO476Pp8g5DTfCKjz9OiePyog1dKXP2jCpZfbdfyB1kZmWSonYRSDuEA=s90", source_recipe_url: "http://smittenkitchen.com/blog/2010/05/spring-asparagus-pancetta-hash/", source_site_url: "http://smittenkitchen.com", source_display_name: "Smitten Kitchen", yummly_id: "Spring-asparagus-pancetta-hash-305493", total_time: "1 hr", total_time_in_seconds: "3600", ingredients: "1/4 pound pancetta (a cured pork that is less salty than proscuitto, and not smoked like bacon), cut into 1/4-inch dice|1 pound Yukon gold potatoes, peeled and cut into a 1/2-inch dice|1 small yellow onion, chopped small|1/2 pound asparagus, tough ends trimmed and cut into 1-inch segments|Salt and pepper to taste|Salt and pepper to taste", credit: "<a href='http://www.yummly.com/recipe/Spring-asparagus-pancetta-hash-305493'>Spring Asparagus Pancetta Hash recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Roasted Brussels Sprouts and Golden Beets", large_image_url: "http://lh4.ggpht.com/PSy-_spETni-CmgY_F1R6g3Np6CADOl7U3qyeJ7O3Om4UthrcukZgbv6sQbeOy_oKmIiXxfLg_Wg4siPlZiM9g=s360", small_image_url: "http://lh4.ggpht.com/PSy-_spETni-CmgY_F1R6g3Np6CADOl7U3qyeJ7O3Om4UthrcukZgbv6sQbeOy_oKmIiXxfLg_Wg4siPlZiM9g=s90", source_recipe_url: "http://food52.com/recipes/15188-roasted-brussels-sprouts-and-golden-beets", source_site_url: "http://food52.com", source_display_name: "Food52", yummly_id: "Roasted-brussels-sprouts-and-golden-beets-327999", total_time: "35 min", total_time_in_seconds: "2100", ingredients: "10-12 Brussels sprouts, trimmed and halved|1 Fennel bulb, stalks removed and chopped|10 Golden beets, peeled and chopped|1-2 Shallots, chopped|2 tablespoons Olive Oil|2 tablespoons Apple cider", credit: "<a href='http://www.yummly.com/recipe/Roasted-brussels-sprouts-and-golden-beets-327999'>Roasted Brussels Sprouts and Golden Beets recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Cheese Biscuits", large_image_url: "http://lh3.ggpht.com/jZ2od91eZnjdaQaf5CyrN_cRNE5KZg9EB2RfMdiB2DxOLQHrpYwaZBZHwS6xC4IsIgMEEa2CXh21G8oSZE_5ng=s360", small_image_url: "http://lh3.ggpht.com/jZ2od91eZnjdaQaf5CyrN_cRNE5KZg9EB2RfMdiB2DxOLQHrpYwaZBZHwS6xC4IsIgMEEa2CXh21G8oSZE_5ng=s90", source_recipe_url: "http://food52.com/recipes/11454-cheese-biscuits", source_site_url: "http://food52.com", source_display_name: "Food52", yummly_id: "Cheese-biscuits-325281", total_time: "1 hr", total_time_in_seconds: "3600", ingredients: "3 1/2 cups minus 1 teaspoon all-purpose flour, plus more for shaping|2 tablespoons baking powder|2 1/2 teaspoons kosher salt|9 tablespoons plus 1 teaspoon cold unsalted butter (use a good brand, like Plugra, with a high butterfat content)|2 cups grated sharp cheddar cheese|1 3/4 cup buttermilk|1 large egg", credit: "<a href='http://www.yummly.com/recipe/Cheese-biscuits-325281'>Cheese Biscuits recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Blue Smoke's Pork Ribs", large_image_url: "http://lh6.ggpht.com/3pqsnLW6odJISwGC-2E-UNneyFAXr2W3U0ARMiSzD5sarnY1HqSAvlro7dWg4qH1RUAb2Qp0QMN9zmqdncWkdA=s360", small_image_url: "http://lh6.ggpht.com/3pqsnLW6odJISwGC-2E-UNneyFAXr2W3U0ARMiSzD5sarnY1HqSAvlro7dWg4qH1RUAb2Qp0QMN9zmqdncWkdA=s90", source_recipe_url: "http://www.marthastewart.com/343726/blue-smokes-pork-ribs", source_site_url: "http://www.marthastewart.com", source_display_name: "Martha Stewart", yummly_id: "Blue-Smoke_s-Pork-Ribs-Martha-Stewart-195539", total_time: "30 min", total_time_in_seconds: "1800", ingredients: "2 tablespoons dark-brown sugar|1 tablespoon superfine sugar|1 teaspoon celery salt|1 teaspoon table salt|1/2 teaspoon sweet paprika|1/2 teaspoon ground ancho pepper|1/4 teaspoon granulated onion|1/4 teaspoon granulated garlic|1/4 teaspoon cayenne pepper|1/4 teaspoon ground coriander|1/4 teaspoon freshly ground pepper|1/4 teaspoon dried sage|1/4 teaspoon ground cinnamon|1/4 teaspoon freshly grated nutmeg|1 rack St. Louis-style pork ribs", credit: "<a href='http://www.yummly.com/recipe/Blue-Smoke_s-Pork-Ribs-Martha-Stewart-195539'>Blue Smoke's Pork Ribs recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Chinese Chicken Wings", large_image_url: "http://lh6.ggpht.com/Al_uuXWqdK9x-rZrLJNooocwBqZsZ9bXdED9Ky3UfyXnyl4sd9TtCJncGrqVHckbA1qWItQD3DRXG2GYQ-fLbQ=s360", small_image_url: "http://lh6.ggpht.com/Al_uuXWqdK9x-rZrLJNooocwBqZsZ9bXdED9Ky3UfyXnyl4sd9TtCJncGrqVHckbA1qWItQD3DRXG2GYQ-fLbQ=s90", source_recipe_url: "http://food52.com/recipes/6779-chinese-chicken-wings", source_site_url: "http://food52.com", source_display_name: "Food52", yummly_id: "Chinese-chicken-wings-320504", total_time: "1 hr", total_time_in_seconds: "3600", ingredients: "18 chicken wings|1/2 cup soy sauce|1/2 cup honey|1/2 cup lemon juice (bottled)|alot of garlic powder", credit: "<a href='http://www.yummly.com/recipe/Chinese-chicken-wings-320504'>Chinese Chicken Wings recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Caprese Quinoa", large_image_url: "http://lh6.ggpht.com/p8zH4LtrEJ3YW5dFm6hxVGJPMYgQTWmR5b-d1oPrxkeedqwMv1q9HNyJFs9ew49duw-MEpa14fsiYjKcQHIFqw=s360", small_image_url: "http://lh6.ggpht.com/p8zH4LtrEJ3YW5dFm6hxVGJPMYgQTWmR5b-d1oPrxkeedqwMv1q9HNyJFs9ew49duw-MEpa14fsiYjKcQHIFqw=s90", source_recipe_url: "http://www.howsweeteats.com/2011/07/quick-caprese-quinoa-with-homemade-basil-oil/", source_site_url: "http://www.howsweeteats.com", source_display_name: "How Sweet It Is", yummly_id: "Caprese-quinoa-333659", total_time: "50 min", total_time_in_seconds: "3000", ingredients: "1 cup uncooked quinoa|16 oz container of grape tomatoes, quartered|3/4 cup fresh mozzarella pearls (or just buy a fresh mozzarella ball and cut it into chunks)|10 large basil leaves, cut into ribbons|1/2 teaspoon sea salt|1/2 teaspoon pepper|1 cup olive oil|1 1/2 cups packed basil leaves (I used 3 handfuls), coarsely chopped", credit: "<a href='http://www.yummly.com/recipe/Caprese-quinoa-333659'>Caprese Quinoa recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Mushroom and Leek Risotto", large_image_url: "http://lh4.ggpht.com/X8Wcwl1w2cxa9_FpIwaZeR9N7lEveqA9kx0BFUNi3gcbG4THbO5WNBamL72MALKeK5itB2ke3eBalt2QOLzxog=s360", small_image_url: "http://lh4.ggpht.com/X8Wcwl1w2cxa9_FpIwaZeR9N7lEveqA9kx0BFUNi3gcbG4THbO5WNBamL72MALKeK5itB2ke3eBalt2QOLzxog=s90", source_recipe_url: "http://www.thekitchn.com/recipe-mushroom-and-leek-risotto-98626", source_site_url: "http://www.thekitchn.com", source_display_name: "The Kitchn", yummly_id: "Mushroom-and-leek-risotto-307949", total_time: nil, total_time_in_seconds: nil, ingredients: "1/2 ounce dried mushrooms, optional|2 tablespoons unsalted butter|1 large leek, washed thoroughly and sliced|1/2 shallot or 1/4 small red onion, finely diced|2 cups roughly chopped fresh mushrooms|2 tablespoons fresh thyme leaves|2 cups (1 pound) white arborio rice|1/2 cup dry white wine or cream sherry|4 to 5 cups liquid, such as chicken broth, beef broth, the water used to steep dried mushrooms", credit: "<a href='http://www.yummly.com/recipe/Mushroom-and-leek-risotto-307949'>Mushroom and Leek Risotto recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Crab Avocado Quesadillas", large_image_url: "http://lh6.ggpht.com/BMc22h9ffrHSmKTZmuTfBIHAkjTaaBpZhReelWQcuDaQU-BpRFwPQUD8u7JXf_OiFZJW_bPcy_NfQMIyMIdo=s360", small_image_url: "http://lh6.ggpht.com/BMc22h9ffrHSmKTZmuTfBIHAkjTaaBpZhReelWQcuDaQU-BpRFwPQUD8u7JXf_OiFZJW_bPcy_NfQMIyMIdo=s90", source_recipe_url: "http://www.howsweeteats.com/2010/04/crab-avocado-quesadillas/", source_site_url: "http://www.howsweeteats.com", source_display_name: "How Sweet It Is", yummly_id: "Crab-avocado-quesadillas-333802", total_time: "30 min", total_time_in_seconds: "1800", ingredients: "2 whole wheat tortillas|2 oz lump crab meat|1 slice bacon, fried and crumbled|2 slices avocado, chopped|1 tablespoon chopped shallots|1/4 cup low-fat, shredded mozzarella cheese|1 slice pineapple, chopped", credit: "<a href='http://www.yummly.com/recipe/Crab-avocado-quesadillas-333802'>Crab Avocado Quesadillas recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Cavatappi with Sausage & Kale", large_image_url: "http://lh6.ggpht.com/80X8VPuzXaJVHFcPI5_X8gakPAqNp3kxUDC3Lk_v_uhLVPxgd2ZOjNp0Gw_nFvLy4igUTw9ubrRajSO6NX4hoA=s360", small_image_url: "http://lh6.ggpht.com/80X8VPuzXaJVHFcPI5_X8gakPAqNp3kxUDC3Lk_v_uhLVPxgd2ZOjNp0Gw_nFvLy4igUTw9ubrRajSO6NX4hoA=s90", source_recipe_url: "http://camillestyles.com/tuesday-tastings/tuesday-tastings-cavatappi-sausage-kale/", source_site_url: "http://camillestyles.com", source_display_name: "Camille Styles", yummly_id: "Cavatappi-with-Sausage-_-Kale-571831", total_time: "30 min", total_time_in_seconds: "1800", ingredients: "2 tablespoons olive oil|1 clove garlic, peeled and minced|1 shallot, peeled and sliced|1/2 lb spicy italian sausage, casings discarded|1/2 lb kale, tough stems and center ribs discarded and leaves coarsely chopped|1/2 lb kale, tough stems and center ribs discarded and leaves coarsely chopped|1/2 lb dried cavatappi, cavatelli or gemelli|28 oz can whole tomatoes in puree|1/3 cup half & half|1 oz finely grated Pecorino Romano", credit: "<a href='http://www.yummly.com/recipe/Cavatappi-with-Sausage-_-Kale-571831'>Cavatappi with Sausage &amp; Kale recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Egg in a Frame (Toad in a Hole)", large_image_url: "http://lh4.ggpht.com/J8bUaGxl-vZI987MD93_e8M98FZRmO17IMWBnWlcUy8oxpE_U0TRg_9ehgVvEHF5c0r5vQz7SEaBVyWssVBJgg=s360", small_image_url: "http://lh4.ggpht.com/J8bUaGxl-vZI987MD93_e8M98FZRmO17IMWBnWlcUy8oxpE_U0TRg_9ehgVvEHF5c0r5vQz7SEaBVyWssVBJgg=s90", source_recipe_url: "http://www.yummly.com/recipe/Egg-in-a-Frame-_Toad-in-a-Hole_-568587", source_site_url: "http://nelliescagefree.com/", source_display_name: "Nellie's Cage-Free Eggs Brand", yummly_id: "Egg-in-a-Frame-_Toad-in-a-Hole_-568587", total_time: nil, total_time_in_seconds: nil, ingredients: "2 slices Barowsky's Organic white or whole wheat bread|2 tsp. Catania-Spagna Atlantic Organic olive oil|2 Nellie's Cage Free Eggs|Salt and pepper", credit: "<a href='http://www.yummly.com/recipe/Egg-in-a-Frame-_Toad-in-a-Hole_-568587'>Egg in a Frame (Toad in a Hole) recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "T-Bone Steaks with Hotel Butter", large_image_url: "http://lh4.ggpht.com/xO6M__1frRnfdjttv0pwE70h8EGOCP6VgXbGXH7Nhab6CQu98HhdyJWpbATxH82GtjRdjIO3cX60xWd-n1rDwA=s360", small_image_url: "http://lh4.ggpht.com/xO6M__1frRnfdjttv0pwE70h8EGOCP6VgXbGXH7Nhab6CQu98HhdyJWpbATxH82GtjRdjIO3cX60xWd-n1rDwA=s90", source_recipe_url: "http://thepioneerwoman.com/cooking/2012/08/t-bone-steaks-with-hotel-butter/", source_site_url: "http://thepioneerwoman.com", source_display_name: "The Pioneer Woman", yummly_id: "T-bone-steaks-with-hotel-butter-302480", total_time: "45 min", total_time_in_seconds: "2700", ingredients: "HOTEL BUTTER|2 sticks Salted Butter, Softened|1/3 cup Finely Minced Parsley|1 whole Lemon, Zested And Halved|Finely Minced Garlic, Salt, Pepper, Any Mix Of Herbs, Crushed Red Pepper, Paprika, Etc. (optional)|Finely Minced Garlic, Salt, Pepper, Any Mix Of Herbs, Crushed Red Pepper, Paprika, Etc. (optional)|Finely Minced Garlic, Salt, Pepper, Any Mix Of Herbs, Crushed Red Pepper, Paprika, Etc. (optional)|Steaks|4 whole Steaks (ribeye, T-bone, Filet)|Salt And Pepper, to taste|Salt And Pepper, to taste|Butter, For Frying", credit: "<a href='http://www.yummly.com/recipe/T-bone-steaks-with-hotel-butter-302480'>T-Bone Steaks with Hotel Butter recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Cabbage with Mustard Seeds", large_image_url: "http://lh5.ggpht.com/VBJ6SeQ1I0h4TJniJicsqB6VBh5R8a0pAUR_gbKOkQ4QksKuU_oZzy9MwzQNo94-PE6mBOFH_Tx9QVsDX4Ou4A=s360", small_image_url: "http://lh5.ggpht.com/VBJ6SeQ1I0h4TJniJicsqB6VBh5R8a0pAUR_gbKOkQ4QksKuU_oZzy9MwzQNo94-PE6mBOFH_Tx9QVsDX4Ou4A=s90", source_recipe_url: "http://www.biggirlssmallkitchen.com/2011/09/meatless-monday-quick-cabbage-with-mustard-seeds.html", source_site_url: "http://www.biggirlssmallkitchen.com", source_display_name: "Big Girls Small Kitchen", yummly_id: "Cabbage-with-mustard-seeds-310170", total_time: "25 min", total_time_in_seconds: "1500", ingredients: "2 teaspoons neutral oil|1 teaspoon brown mustard seeds|1 small cabbage, cored, trimmed, and sliced thinly|1 onion, thinly sliced|2 tablespoons butter, cut into chunks|1/2 teaspoon salt, plus more to taste.", credit: "<a href='http://www.yummly.com/recipe/Cabbage-with-mustard-seeds-310170'>Cabbage with Mustard Seeds recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Grilled Artichokes", large_image_url: "http://lh4.ggpht.com/0N3KBeN76bd3X6uNXo0llYPlfqjVjMFTEkip87e5vNDZF9Zohm4_YYl3OtNDuO0TpH_YPioSxKgHgTfYAcxhrA=s360", small_image_url: "http://lh4.ggpht.com/0N3KBeN76bd3X6uNXo0llYPlfqjVjMFTEkip87e5vNDZF9Zohm4_YYl3OtNDuO0TpH_YPioSxKgHgTfYAcxhrA=s90", source_recipe_url: "http://www.thekitchn.com/recipe-grilled-artichokes-recipes-from-the-kitchn-201441", source_site_url: "http://www.thekitchn.com", source_display_name: "The Kitchn", yummly_id: "Grilled-Artichokes-532113", total_time: "1 hr", total_time_in_seconds: "3600", ingredients: "3 whole artichokes|1 lemon|1 tablespoon salt|1 tablespoon whole peppercorns|4-6 cloves garlic|3 tablespoons olive oil", credit: "<a href='http://www.yummly.com/recipe/Grilled-Artichokes-532113'>Grilled Artichokes recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Pepper-Crusted Filet Mignon", large_image_url: "http://lh3.ggpht.com/cIp6fBwit6ngHe429PLVLk-22NzGTTkWvEoqNy57DgdPm6OHQH9odMKSkw4K4SW_bOpHXde4eOYz3lMzXrXz=s360", small_image_url: "http://lh3.ggpht.com/cIp6fBwit6ngHe429PLVLk-22NzGTTkWvEoqNy57DgdPm6OHQH9odMKSkw4K4SW_bOpHXde4eOYz3lMzXrXz=s90", source_recipe_url: "http://www.chow.com/recipes/29302-pepper-crusted-filet-mignon", source_site_url: "http://www.chow.com", source_display_name: "Chow", yummly_id: "Pepper-Crusted-Filet-Mignon-508094", total_time: "25 min", total_time_in_seconds: "1500", ingredients: "1 tablespoon whole black peppercorns|1 tablespoon whole green peppercorns|2 tablespoons unsalted butter (1/4 stick), at room temperature|4 (6-ounce) filet mignon steaks (about 1 1/2 inches thick)|Kosher salt|2 tablespoons olive oil", credit: "<a href='http://www.yummly.com/recipe/Pepper-Crusted-Filet-Mignon-508094'>Pepper-Crusted Filet Mignon recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Kale, Bacon and Egg Sandwich", large_image_url: "http://lh3.ggpht.com/SdG-c-skdeze7VBIn4B7B8ou4JWcK8aLLk2dJ00minspLwhMdumFFQmh4clPSK0Tu8iX5ebotFLLzaQnxyoh=s360", small_image_url: "http://lh3.ggpht.com/SdG-c-skdeze7VBIn4B7B8ou4JWcK8aLLk2dJ00minspLwhMdumFFQmh4clPSK0Tu8iX5ebotFLLzaQnxyoh=s90", source_recipe_url: "http://www.thekitchn.com/recipe-kale-bacon-and-egg-breakfast-sandwich-177192", source_site_url: "http://www.thekitchn.com", source_display_name: "The Kitchn", yummly_id: "Kale_-bacon-and-egg-sandwich-307976", total_time: "35 min", total_time_in_seconds: "2100", ingredients: "1 piece bacon|1 1/2 cups kale, chopped into 1/2\" ribbons|1 clove garlic, minced|1/4 teaspoon white wine vinegar|1 whole wheat bun, toasted|1 tablespoon vegetable oil|1 large egg|Mayonnaise or softened butter (optional)", credit: "<a href='http://www.yummly.com/recipe/Kale_-bacon-and-egg-sandwich-307976'>Kale, Bacon and Egg Sandwich recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Sizzling Flounder", large_image_url: "http://lh5.ggpht.com/tCwX3FUn41s1H0ZqZQMzZgCC-B4q5CFotH2wIaQCJ7nffNyFsdPv2iUI86MOy4EA0QCHbTz9SndehVxPpEdO=s360", small_image_url: "http://lh5.ggpht.com/tCwX3FUn41s1H0ZqZQMzZgCC-B4q5CFotH2wIaQCJ7nffNyFsdPv2iUI86MOy4EA0QCHbTz9SndehVxPpEdO=s90", source_recipe_url: "http://www.myrecipes.com/recipe/sizzling-flounder-10000001966727/", source_site_url: "http://www.myrecipes.com", source_display_name: "MyRecipes", yummly_id: "Sizzling-Flounder-MyRecipes-246319", total_time: "40 min", total_time_in_seconds: "2400", ingredients: "1/4 cup grated Parmesan cheese|1 teaspoon paprika|4 (6-oz.) flounder fillets|3/4 teaspoon salt|1/4 teaspoon pepper|1/2 cup butter|2 tablespoons fresh lemon juice", credit: "<a href='http://www.yummly.com/recipe/Sizzling-Flounder-MyRecipes-246319'>Sizzling Flounder recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Barbequed Steak", large_image_url: "http://lh4.ggpht.com/SNPiSyOpAuYR-D6EKz_mp8y4eq_O4Ii1eAYxNEm4DvxJrnMk4ZeaUVcVUNqCLdcB8VQuSUF8a6t-mwvbi2ONgg=s360", small_image_url: "http://lh4.ggpht.com/SNPiSyOpAuYR-D6EKz_mp8y4eq_O4Ii1eAYxNEm4DvxJrnMk4ZeaUVcVUNqCLdcB8VQuSUF8a6t-mwvbi2ONgg=s90", source_recipe_url: "http://allrecipes.com/Recipe/barbequed-steak/detail.aspx", source_site_url: "http://www.allrecipes.com", source_display_name: "AllRecipes", yummly_id: "Barbequed-Steak-Allrecipes", total_time: "2 hr", total_time_in_seconds: "7200", ingredients: "4 (1/2 pound) beef top sirloin steaks|1/2 cup vegetable oil|1 ounce steak spice seasoning mix", credit: "<a href='http://www.yummly.com/recipe/Barbequed-Steak-Allrecipes'>Barbequed Steak recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Turkey Paitan Ramen With Crispy Turkey and Soft Cooked Egg", large_image_url: "http://lh4.ggpht.com/6LVOicDzup0hCLWDvXwjDRF8_FAXpXpkYKueRYznPXV4RzakUCg8q9XAE6pwqh3-BA-1A-Ld-K8uvB_0QCmLy7c=s360", small_image_url: "http://lh4.ggpht.com/6LVOicDzup0hCLWDvXwjDRF8_FAXpXpkYKueRYznPXV4RzakUCg8q9XAE6pwqh3-BA-1A-Ld-K8uvB_0QCmLy7c=s90", source_recipe_url: "http://www.seriouseats.com/recipes/2013/11/turkey-paitain-ramen-crispy-turkey-soft-cooked-egg-recipe.html", source_site_url: "http://www.seriouseats.com", source_display_name: "Serious Eats", yummly_id: "Turkey-Paitan-Ramen-With-Crispy-Turkey-and-Soft-Cooked-Egg-479642", total_time: nil, total_time_in_seconds: nil, ingredients: "3 pounds turkey backs and wings or leftover roasted turkey bones and carcass, roughly chopped with a cleaver or a heavy duty chef's knife|2 pounds turkey drumsticks and/or thighs|3 tablespoons vegetable oil, divided|1 large onion, skin on, roughly chopped|16 garlic cloves, divided|One 3-inch knob ginger, roughly chopped|2 whole leeks, washed and roughly chopped|2 dozen scallions, white parts only (reserve greens and light green parts for garnishing finished soup)|6 ounces whole mushrooms or mushroom scraps|1/2 cup red or white miso paste|1/4 cup sesame tahini|12 Brussels sprouts, divided into individual leaves|Kosher salt|6 to 8 servings ramen-style noodles|6 to 8 marinated eggs, or sous-vide soft boiled eggs|2 to 3 tablespoons mayu (black garlic oil) or toasted sesame oil, for serving", credit: "<a href='http://www.yummly.com/recipe/Turkey-Paitan-Ramen-With-Crispy-Turkey-and-Soft-Cooked-Egg-479642'>Turkey Paitan Ramen With Crispy Turkey and Soft Cooked Egg recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Pumpkin Cheesecake", large_image_url: "http://lh6.ggpht.com/oSXz1NLuTo3wOC-GzDthCzSZw2urmO7fm3dJyp8Rbhc3mY-WIqs4lrKE7yDPhqFZTbcg3S_g7SjMV44QhW_9yD8=s360", small_image_url: "http://lh6.ggpht.com/oSXz1NLuTo3wOC-GzDthCzSZw2urmO7fm3dJyp8Rbhc3mY-WIqs4lrKE7yDPhqFZTbcg3S_g7SjMV44QhW_9yD8=s90", source_recipe_url: "http://www.yummly.com/recipe/Pumpkin-Cheesecake-568580", source_site_url: "http://nelliescagefree.com/", source_display_name: "Nellie's Cage-Free Eggs Brand", yummly_id: "Pumpkin-Cheesecake-568580", total_time: nil, total_time_in_seconds: nil, ingredients: "2 cups organic graham cracker crumbs|1/2 teaspoon ginger|1/2 teaspoon cinnamon|1/3 cup melted butter|1/4 cup organic sugar|2 lbs organic cream cheese softened|3 tablespoons Maple Grove Farms organic maple syrup|1 teaspoon ginger|1 teaspoon cinnamon|1/2 teaspoon nutmeg|1/4 cup organic whipping cream|1-1/4 cups organic sugar|3 tablespoons cognac|4 Pete and Gerry's Organic Eggs at room temperature|1 cup Farmer's Market organic canned pumpkin", credit: "<a href='http://www.yummly.com/recipe/Pumpkin-Cheesecake-568580'>Pumpkin Cheesecake recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Zesty Duck", large_image_url: "http://lh5.ggpht.com/uUAmDKHnY0qATg5MLPCdS3WjVmR_wlQ8PP85jbxBsCnoCjMEdyZv4J6E7AcY6HgCbt5L0DAq1clHHi8NOww3eCE=s360", small_image_url: "http://lh5.ggpht.com/uUAmDKHnY0qATg5MLPCdS3WjVmR_wlQ8PP85jbxBsCnoCjMEdyZv4J6E7AcY6HgCbt5L0DAq1clHHi8NOww3eCE=s90", source_recipe_url: "http://food52.com/recipes/15742-zesty-duck", source_site_url: "http://food52.com", source_display_name: "Food52", yummly_id: "Zesty-duck-328635", total_time: "35 min", total_time_in_seconds: "2100", ingredients: "2 Duck breast|2 Meyer Lemons|1 Orange|2 tablespoons Fresh thyme or Lebanese Thyme", credit: "<a href='http://www.yummly.com/recipe/Zesty-duck-328635'>Zesty Duck recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Pepperoni Puffs", large_image_url: "http://lh4.ggpht.com/6pNVCXGwkn3M5G1PUgRGmkQ6t_GZMU_VHclLh2sjEGxH3vUeGwWoEuVghniEqD1HK90DcLQmnEjfHU6M8L8s7Q=s360", small_image_url: "http://lh4.ggpht.com/6pNVCXGwkn3M5G1PUgRGmkQ6t_GZMU_VHclLh2sjEGxH3vUeGwWoEuVghniEqD1HK90DcLQmnEjfHU6M8L8s7Q=s90", source_recipe_url: "http://www.myrecipes.com/recipe/pepperoni-puffs-53420000015780/", source_site_url: "http://www.myrecipes.com", source_display_name: "MyRecipes", yummly_id: "Pepperoni-puffs-344408", total_time: "50 min", total_time_in_seconds: "3000", ingredients: "1 cup all-purpose flour|1 teaspoon baking powder|1 cup milk|1 egg, beaten|1 cup shredded Cheddar cheese|1 1/2 cups pepperoni, diced", credit: "<a href='http://www.yummly.com/recipe/Pepperoni-puffs-344408'>Pepperoni Puffs recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "When Pigs Fly Wings", large_image_url: "http://lh3.ggpht.com/eip724Gwe5E9J_tLzZVWM1PoMZyHn5U9g1z5PN_6x_F4Vl2YVvyohm_ZHSUNbylSMfnIiAznrSztmFt0uF7cTA=s360", small_image_url: "http://lh3.ggpht.com/eip724Gwe5E9J_tLzZVWM1PoMZyHn5U9g1z5PN_6x_F4Vl2YVvyohm_ZHSUNbylSMfnIiAznrSztmFt0uF7cTA=s90", source_recipe_url: "http://www.foodrepublic.com/2011/09/07/when-pigs-fly-wings-recipe", source_site_url: "http://www.foodrepublic.com", source_display_name: "Food Republic", yummly_id: "When-Pigs-Fly-Wings-513710", total_time: "1 hr", total_time_in_seconds: "3600", ingredients: "3 cups pork rinds|2 large eggs|4 tablespoons butter, melted and slightly cooled|12 chicken wings, cut in half at joints, wing tips removed and discarded", credit: "<a href='http://www.yummly.com/recipe/When-Pigs-Fly-Wings-513710'>When Pigs Fly Wings recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Lobster Rolls", large_image_url: "http://lh4.ggpht.com/CPMh1y6bFuPD02XdqU0z0vDjO6s0XBJC93_gtDYlilV3y59AbgvDoU_iZ-3qx0Qwvxay8G9mkjgk2pvEjMEIKQ=s360", small_image_url: "http://lh4.ggpht.com/CPMh1y6bFuPD02XdqU0z0vDjO6s0XBJC93_gtDYlilV3y59AbgvDoU_iZ-3qx0Qwvxay8G9mkjgk2pvEjMEIKQ=s90", source_recipe_url: "http://smittenkitchen.com/blog/2009/08/lobster-rolls/", source_site_url: "http://smittenkitchen.com", source_display_name: "Smitten Kitchen", yummly_id: "Lobster-rolls-305538", total_time: "35 min", total_time_in_seconds: "2100", ingredients: "2 pounds cooked lobster meat*, chopped roughly into 1/2 and 3/4-inch pieces|1 small celery rib, finely chopped|1/4 cup mayonnaise (Charles insists on Hellman’s; I didn’t argue)|Squeeze or two of lemon juice|Pinch of kosher salt and freshly ground black pepper|2 top-loading hot dog buns or 64 miniature burger buns (described above) or small dinner rolls|Unsalted butter|Snipped fresh chives for garnish (though we mixed ours right into the salad, for convenience)", credit: "<a href='http://www.yummly.com/recipe/Lobster-rolls-305538'>Lobster Rolls recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Easy Weeknight Brussels Sprouts", large_image_url: "http://lh4.ggpht.com/_k97Alr389G8tvPZzUIpmBAA684IGj9nINywcqvAvJr4Ul-aSGX-V4rzIUJMCZOyJR7baf2pMu8qxk0iArXRNw=s360", small_image_url: "http://lh4.ggpht.com/_k97Alr389G8tvPZzUIpmBAA684IGj9nINywcqvAvJr4Ul-aSGX-V4rzIUJMCZOyJR7baf2pMu8qxk0iArXRNw=s90", source_recipe_url: "http://food52.com/recipes/19972-easy-weeknight-brussels-sprouts", source_site_url: "http://food52.com", source_display_name: "Food52", yummly_id: "Easy-weeknight-brussels-sprouts-330933", total_time: "30 min", total_time_in_seconds: "1800", ingredients: "1 small basket of Brussels Sprouts, cut in half through the stem|1/2 cup Chicken or Vegetable Broth|2 tablespoons Salted Butter|2 tablespoons Olive Oil|Salt and Pepper to taste|Salt and Pepper to taste", credit: "<a href='http://www.yummly.com/recipe/Easy-weeknight-brussels-sprouts-330933'>Easy Weeknight Brussels Sprouts recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Tuna Patties", large_image_url: "http://lh3.ggpht.com/CVMrMA-ozZq3NZKWRIyNEAYVmSeHAHN6nYmNvggHURreKawAfvYpfGHnnIgGI554gQ146kM86d7kgh1u7Zt6sNU=s360", small_image_url: "http://lh3.ggpht.com/CVMrMA-ozZq3NZKWRIyNEAYVmSeHAHN6nYmNvggHURreKawAfvYpfGHnnIgGI554gQ146kM86d7kgh1u7Zt6sNU=s90", source_recipe_url: "http://simplyrecipes.com/recipes/tuna_patties/", source_site_url: "http://simplyrecipes.com", source_display_name: "Simply Recipes", yummly_id: "Tuna-Patties-Simply-Recipes-46812", total_time: "50 min", total_time_in_seconds: "3000", ingredients: "2 6-ounce cans tuna|2 teaspoons Dijon mustard|1/2 cup white bread torn into small pieces|1 teaspoon lemon zest|1 Tbsp lemon juice|1 Tbsp water (or liquid from the cans of tuna)|2 Tbsp chopped fresh parsley|2 Tbsp chopped fresh chives, green onions, or shallots|Salt and freshly ground black pepper|Salt and freshly ground black pepper|A couple squirts of Crystal hot sauce or tabasco|1 raw egg|2 Tbsp olive oil|1/2 teaspoon butter", credit: "<a href='http://www.yummly.com/recipe/Tuna-Patties-Simply-Recipes-46812'>Tuna Patties recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Lamb and Sausage Cassoulet", large_image_url: "http://lh6.ggpht.com/nz5Vt5-5vjAM1sp_2wdoSfa6lduj3KDXj8nSuaBrwPycYiCfkrpB1kJ0HLU8qUWWjww3PUcS3C-MEzeTjxZT5Q=s360", small_image_url: "http://lh6.ggpht.com/nz5Vt5-5vjAM1sp_2wdoSfa6lduj3KDXj8nSuaBrwPycYiCfkrpB1kJ0HLU8qUWWjww3PUcS3C-MEzeTjxZT5Q=s90", source_recipe_url: "http://www.myrecipes.com/recipe/lamb-sausage-cassoulet-50400000117883/", source_site_url: "http://www.myrecipes.com", source_display_name: "MyRecipes", yummly_id: "Lamb-and-Sausage-Cassoulet-MyRecipes-238226", total_time: "3 Hr 31 Min", total_time_in_seconds: "12660", ingredients: "1 cup dried Great Northern beans|3 cups boiling water|2 teaspoons olive oil|8 ounces boneless leg of lamb, trimmed and cut into bite-sized pieces|1/2 teaspoon freshly ground black pepper|1/4 teaspoon kosher salt|4 ounces turkey kielbasa, chopped|1 slice bacon, chopped|1 1/2 cups coarsely chopped onion|1 cup coarsely chopped carrot (about 2 medium)|1/2 cup coarsely chopped celery|6 garlic cloves, smashed|1 tablespoon no-salt-added tomato paste|2 1/2 cups fat-free, lower-sodium chicken broth|1 1/2 cups water|2 tablespoons brandy|1 (2-ounce) piece French bread baguette|1/4 cup (1 ounce) grated Parmesan cheese|3 tablespoons chopped fresh parsley", credit: "<a href='http://www.yummly.com/recipe/Lamb-and-Sausage-Cassoulet-MyRecipes-238226'>Lamb and Sausage Cassoulet recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Chicken Ramen", large_image_url: "http://lh4.ggpht.com/DJDWK6mufYjLvSCXg9Lm_MnKoT8zV84z9gmE7yZeAjcCthxhBLQ9TAbiQaHnP7pWPuMAThp6N2Qjkc4lRQLQ=s360", small_image_url: "http://lh4.ggpht.com/DJDWK6mufYjLvSCXg9Lm_MnKoT8zV84z9gmE7yZeAjcCthxhBLQ9TAbiQaHnP7pWPuMAThp6N2Qjkc4lRQLQ=s90", source_recipe_url: "http://www.seriouseats.com/recipes/2013/10/chicken-ramen-dinner.html", source_site_url: "http://www.seriouseats.com", source_display_name: "Serious Eats", yummly_id: "Chicken-Ramen-451165", total_time: nil, total_time_in_seconds: nil, ingredients: "4 pounds chicken wings|1 pound chicken feet|2 (12-inch) pieces kombu (see note above)|2 leeks, trimmed and sliced 1-inch thick|8 cloves garlic|2 bunches scallions, whites reserved, greens thinly sliced, divided|1 onion, skin-on, halved|6 ounces fresh shiitake mushrooms, washed and trimmed|2-inch piece ginger, sliced|Kosher salt|6 shallots, peeled and sliced thin|1/2 cup vegetable oil|Chicken bouillon cubes (optional, see note above)|6 servings of fresh, dried, or frozen ramen noodles|Toasted white and black sesame seeds, coarse ground|Sesame oil|Marinated soft boiled eggs|Wasabi paste (optional)", credit: "<a href='http://www.yummly.com/recipe/Chicken-Ramen-451165'>Chicken Ramen recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Pork Belly Big Squid Ramen", large_image_url: "http://lh4.ggpht.com/klVMHUWbkiarvC7LxEPKh9CnEgKaP0mgpRpyZyTldapb8uJKX2Nu02WFys9cwbF-6UuK8kt3Oq7_n1j8LpvK=s360", small_image_url: "http://lh4.ggpht.com/klVMHUWbkiarvC7LxEPKh9CnEgKaP0mgpRpyZyTldapb8uJKX2Nu02WFys9cwbF-6UuK8kt3Oq7_n1j8LpvK=s90", source_recipe_url: "http://www.foodrepublic.com/2011/10/26/pork-belly-big-squid-ramen-recipe", source_site_url: "http://www.foodrepublic.com", source_display_name: "Food Republic", yummly_id: "Pork-Belly-Big-Squid-Ramen-511107", total_time: nil, total_time_in_seconds: nil, ingredients: "1/3 cup plus 4 teaspoons (95 g) canola oil|1 pound pork belly|1 pound chicken necks|1 pound pig's feet|1 cup usukuchi soy sauce|2 yellow onions, 1 thinly slice and 1 julienned|3 ounces fresh ginger, peeled and sliced|2 ounces kombu|11 1/2 cups water|6 giant squid or cuttlefish|1 shallot, minced|2 cloves garlic, smashed and minced|5 1/4 ounces spinach|4 teaspoons squid ink, (includes the saved ink)|1/3 cup rice vinegar|8 quail eggs|3 1/2 tablespoons canola oil, plus more for deep-frying|fine sea salt|micro chives", credit: "<a href='http://www.yummly.com/recipe/Pork-Belly-Big-Squid-Ramen-511107'>Pork Belly Big Squid Ramen recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"},
  {title: "Kimchi Fried Rice", large_image_url: "http://lh6.ggpht.com/STgD-LsxqsiizdTzUA1RvJ3NBOmO5DD1CFIu4VOAnU0KmpgoHC6YywJedjiF9yMl5_VeVPKnNxGwAeCYJck1xg=s360", small_image_url: "http://lh6.ggpht.com/STgD-LsxqsiizdTzUA1RvJ3NBOmO5DD1CFIu4VOAnU0KmpgoHC6YywJedjiF9yMl5_VeVPKnNxGwAeCYJck1xg=s90", source_recipe_url: "http://www.seriouseats.com/recipes/2011/10/kimchi-fried-rice-recipe.html", source_site_url: "http://www.seriouseats.com", source_display_name: "Serious Eats", yummly_id: "Kimchi-Fried-Rice-533251", total_time: "20 min", total_time_in_seconds: "1200", ingredients: "3 tablespoons vegetable oil, divided|4 cups kimchi, chopped|1 tablespoon butter|1 tablespoon red pepper paste (gochujang)|4 cups cool cooked white rice, preferably a day old|1 tablespoon sesame oil|4 eggs|sesame seasoned seaweed, crushed|sesame seasoned seaweed, crushed|4 scallions, green parts only, chopped|black pepper", credit: "<a href='http://www.yummly.com/recipe/Kimchi-Fried-Rice-533251'>Kimchi Fried Rice recipe</a> information powered by <img alt='Yummly' src='http://static.yummly.com/api-logo.png'/>"}
])
