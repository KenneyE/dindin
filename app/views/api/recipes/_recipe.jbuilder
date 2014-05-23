json.extract! recipe, :id, :title, :short_description, :body, :created_at, :updated_at
json.author_name recipe.author.username
json.image_url recipe.image.url
json.thumb_url recipe.image.url(:thumb)
json.ingredients recipe.ingredients, partial: 'api/ingredients/ingredient', as: :ingredient
