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
  validates :name, :category, presence: true
  validates :name, uniqueness: true

  has_many :ingredient_uses

  has_many :recipes, through: :ingredient_uses
end
