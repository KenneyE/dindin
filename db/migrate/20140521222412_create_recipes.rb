class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.text :short_description, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
    add_index :recipes, :author_id
  end
end
