# == Schema Information
#
# Table name: ingredient_saves
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  ingredient_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class IngredientSave < ActiveRecord::Base
  belongs_to :user
  belongs_to :ingredient
end
