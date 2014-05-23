module Api
  class IngredientsController < ApiController
    def create
      @ingredient = Ingredient.new(ingredient_params)
      if @ingredient.save
        render partial: "api/ingedients/ingedient", 
          locals: { ingedient: @ingredient }
      else
        render @ingredient.errors.full_messages
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
      params.require(:ingredient).permit(:name, :category, :image, recipes: [])
    end
  end
end
