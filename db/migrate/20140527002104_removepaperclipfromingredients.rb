class Removepaperclipfromingredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :image_file_name
    remove_column :ingredients, :image_content_type
    remove_column :ingredients, :image_file_size
    remove_column :ingredients, :image_updated_at
  end
end
