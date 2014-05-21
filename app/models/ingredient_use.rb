# == Schema Information
#
# Table name: ingredient_uses
#
#  id            :integer          not null, primary key
#  recipe_id     :integer          not null
#  ingredient_id :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class IngredientUse < ActiveRecord::Base
  validates :recipe, :ingredient, presence: true
  validates :recipe, uniqueness: { scope: :ingredient }

  belongs_to :recipe
  belongs_to :ingredient

end
