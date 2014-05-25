class ChangeRecipeAttributionToCredit < ActiveRecord::Migration
  def change
    remove_column :recipes, :atrribution
    add_column :recipes, :credit, :string
  end
end
