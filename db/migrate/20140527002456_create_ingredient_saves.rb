class CreateIngredientSaves < ActiveRecord::Migration
  def change
    create_table :ingredient_saves do |t|
      t.references :user, index: true
      t.references :ingredient, index: true

      t.timestamps
    end
  end
end
