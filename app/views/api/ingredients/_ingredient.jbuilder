json.extract! ingredient, :id, :name, :category, :image, :created_at, :updated_at
json.image_url ingredient.image.url
json.thumb_url ingredient.image.url(:thumb)