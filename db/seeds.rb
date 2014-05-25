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

vegetables = { category: 'Vegetables',
               ingredients: %w( potatoes asparagus tomatoes broccoli cauliflower brussels\ sprouts bok\ choy
                            onions bell\ peppers jalapeno\ peppers lettuce cabbage endive radicchio green\ onions chives
                            kale swiss\ chard mustard\ greens garlic beets radishes carrots peas cucumbers zucchini fava\ beans
                            shallots turnips rutabaga summer\ squash acorn\ squash artichoke avocado parsnips rhubarb sauerkraut
                            kimchi)
}

fruit = { category: 'Fruit',
          ingredients:  %w( apples oranges pears grapes lemons limes kumquats raisins apricots peaches nectarines
                        yuzu mangoes passion\ fruit star\ fruit durian guava bananas raspberries blueberries blackberries cherries
                        kiwis plantains tangerines strawberries )
}

protein = { category: 'Protein',
            ingredients: %w( chicken\ wings chicken\ legs chicken\ breast chicken\ thighs whole\ chicken steak pork pork\ chops
                         lamb lamb\ shanks tofu trout bass tuna salmon whole\ turkey flounder catfish rabbit duck goose ground\ beef 
                         filet\ mignon ribeye\ steaks t-bone\ steaks porterhouse\ steaks pork\ ribs pork\ shank beef\ cheeks turkey\ legs
                         turkey\ breast bratwurst hot\ dogs keilbasa bacon prosciutto ham lamb\ sausage pork\ sausage )
}

dairy = { category: 'Dairy',
          ingredients: %w( milk heavy\ cream half\ and\ half cheddar\ cheese swiss\ cheese blue\ cheese gorgonzola\cheese eggs 
                       duck\ eggs goat\ milk goat\ cheese buttermilk )
}

grains = { category: 'Grains & Legumes',
           ingredients: %w( baguette whole\ wheat\ bread white\ bread macaroni spaghetti penne\ pasta flour brown\ rice white\ rice
                        basmati\ rice farro barley arborio\ rice country\ bread bow\ tie\ pasta black\ beans navy\ beans quinoa kidney\ beans
                        red\ lentils yellow\ lentils green\ lentils fava\ beans canellini\ beans )
}

[vegetables, fruit, protein, dairy, grains].each do |category|
  category[:ingredients].each do |ingredient|
    Ingredient.create(name: ingredient, category: category[:category])
  end
end
