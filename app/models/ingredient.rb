# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  category   :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Ingredient < ActiveRecord::Base
  CATEGORIES = %w( Protein Vegetables Fruit Dairy Grains\ &\ Legumes Other)

  validates :name, :category, presence: true
  validates :name, uniqueness: true

  has_many :ingredient_saves, class_name: 'IngredientSave'

  has_many :users, through: :ingredient_saves, source: :user

  def self.categories
    CATEGORIES
  end
end
