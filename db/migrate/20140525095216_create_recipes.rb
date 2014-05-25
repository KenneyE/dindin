class CreateRecipes < ActiveRecord::Migration
  def change
    drop_table :recipes
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :atrribution
      t.string :ingredients, null: false
      t.string :large_image_url
      t.string :small_image_url, null: false
      t.string :source_recipe_url
      t.string :source_site_url
      t.string :source_display_name, null: false
      t.string :yummly_id, null: false
      t.string :total_time
      t.string :total_time_in_seconds
      t.timestamps
    end

    add_index :recipes, :title, unique: true
    add_index :recipes, :yummly_id, unique: true
  end
end
