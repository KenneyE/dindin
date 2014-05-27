# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient_safe, :class => 'IngredientSave' do
    user nil
    ingredient nil
  end
end
