require "test_helper"

class IngredientTest < ActiveSupport::TestCase

  def ingredient
    @ingredient ||= Ingredient.new
  end

  def test_valid
    assert ingredient.valid?
  end

end
