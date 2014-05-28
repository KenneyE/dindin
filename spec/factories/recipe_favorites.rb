# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe_favorite do
    user nil
    recipe nil
  end
end
