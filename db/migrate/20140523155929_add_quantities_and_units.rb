class AddQuantitiesAndUnits < ActiveRecord::Migration
  def change
    add_column :ingredient_uses, :quantity, :string
    add_column :ingredient_uses, :unit, :string
  end
end
