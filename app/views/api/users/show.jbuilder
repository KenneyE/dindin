json.extract! @user, :id, :username
json.saved_ingredients @user.saved_ingredients, partial: 'api/ingredients/ingredient', as: :ingredient