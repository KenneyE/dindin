require "test_helper"

class IngredientUseTest < ActiveSupport::TestCase

  def ingredient_use
    @ingredient_use ||= IngredientUse.new
  end

  def test_valid
    assert ingredient_use.valid?
  end

end
