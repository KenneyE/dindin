class ChangeRecipeCreditFromStringToText < ActiveRecord::Migration
  def change
    change_column :recipes, :credit, :text
  end
end
