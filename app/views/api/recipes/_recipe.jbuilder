json.extract! recipe, :id, :title, :short_description, :body, :author_id, :created_at, :updated_at
json.ingredients recipe.ingredients, partial: 'api/ingredients/ingredient', as: :ingredient
json.author_name recipe.author.username