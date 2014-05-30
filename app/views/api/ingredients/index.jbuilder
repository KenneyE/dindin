json.cache! ['v1', @ingredients], expires_in: 15.minutes do
  json.array! @ingredients, partial: 'api/ingredients/ingredient', as: :ingredient
end