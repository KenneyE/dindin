class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    render :index
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes
    render :show
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :category, recipes: [])
  end
end
