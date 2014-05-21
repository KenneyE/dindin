class CreateIngredientUses < ActiveRecord::Migration
  def change
    create_table :ingredient_uses do |t|
      t.integer :recipe_id, null: false
      t.integer :ingredient_id, null: false

      t.timestamps
    end

    add_index :ingredient_uses, :recipe_id
    add_index :ingredient_uses, :ingredient_id
    add_index :ingredient_uses, [:recipe_id, :ingredient_id], unique: true
  end
end
