class AddAuthorToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :author_id, :integer, null: false
    add_index :recipes, :author_id
  end
end
