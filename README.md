Din Din
===========

Do you ever find yourself with opening your fridge and finding a hodgepodge of ingredients that you're not sure what to do with? That's where Din Din comes in. Din Din is a recipe search site that helps you discover recipes that use ingredients you already have on hand!

###Search for Recipes
In Din Din, ingredients are represented by multi-colored tiles. To perform a simple recipe search, you can drag and drop ingredient tiles into the search field, and matching recipes from several of the web's top cooking sites are return via [Yummly's](http://www.yummly.com) recipe search API.

###Save Ingredients in Your Fridge
Searching for recipes is great, but wouldn't it be even better to know what you can make with what you already have on hand? With Din Din, you can access your virtual "frige" by sliding it out on the left side of the screen. Place ingredients that you actually have in your fridge, and they will be stored until you remove them. Now when you search for recipes, each recipe in the result tells you what ingredients you already have, and what ingredients you would need to buy in order to make it.

###Favorite recipes
When viewing a recipe, click the heart in the upper right corner to save the recipe to your favorite recipes. You can access your favorite recipe page at any time to browse through recipes you love.

Technologies Used
------------------
Din Din was built with a Ruby on Rails back end that interfaces with a Backbone.js front end via a JSON API. The Rails back end also gather recipe search results by consuming [Yummly's](http://www.yummly.com) web API. jQuery UI's .sortable() method was employed extensively for Din Din's ingredient tile-based UI, and CSS3 transitions and transforms were used for several UI effects.

TODO
--------
* Recipe search results should be ranked by number of ingredient matches
* Add better screen size responsiveness and mobile touch capability