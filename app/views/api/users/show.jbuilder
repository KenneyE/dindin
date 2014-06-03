json.extract! @user, :id, :username
json.saved_ingredients @user.saved_ingredients, partial: 'api/ingredients/ingredient', as: :ingredient
json.favorite_recipes @user.favorite_recipes, :id, :title
json.created_at @user.created_at.to_i