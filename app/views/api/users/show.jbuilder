json.extract! @user, :username
json.saved_ingredients @user.saved_ingredients, partial: 'api/ingredients/ingredient', as: :ingredient