class ChangeRecipeIngredientsFromIntegerToText < ActiveRecord::Migration
  def change
  remove_column :recipes, :ingredients
  add_column :recipes, :ingredients, :text
  end
end
