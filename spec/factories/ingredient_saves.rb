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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient_safe, :class => 'IngredientSave' do
    user nil
    ingredient nil
  end
end
