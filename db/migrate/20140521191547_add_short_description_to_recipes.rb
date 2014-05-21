class AddShortDescriptionToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :short_description, :text, null: false
  end
end
