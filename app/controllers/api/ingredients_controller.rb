module Api
  class IngredientsController < ApiController
    def create
      @ingredient = Ingredient.new(ingredient_params)
      if @ingredient.save
        render partial: "api/ingredients/ingredient", 
          locals: { ingredient: @ingredient }
      else
        render @ingredient.errors.full_messages
      end
    end

    def index
      @ingredients = Ingredient.all.shuffle
      render :index
    end

    def show
      @ingredient = Ingredient.find(params[:id])
      render partial: "api/ingredients/ingredient", 
        locals: { ingredient: @ingredient }
    end

    private

    def ingredient_params
      params.require(:ingredient).permit(:name, :category)
    end
  end
end
