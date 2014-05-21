class IngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      # render json: @ingredient
      redirect_to new_recipe_url
    else
      flash.now[:errors] = @ingredient.errors.full_messages
      render json: @ingredient.errors
    end
  end

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
