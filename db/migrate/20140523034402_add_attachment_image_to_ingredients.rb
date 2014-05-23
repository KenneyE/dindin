class AddAttachmentImageToIngredients < ActiveRecord::Migration
  def self.up
    change_table :ingredients do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :ingredients, :image
  end
end
