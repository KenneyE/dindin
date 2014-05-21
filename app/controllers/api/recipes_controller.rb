module Api
  class RecipesController < ApiController
    def create
      @recipe = Recipe.new(recipe_params)
      @recipe.author_id = current_user.id
      if @recipe.save
        redirect_to @recipe
      else
        flash.now[:errors] = @recipe.errors.full_messages
        render :new
      end
    end

    def index
      @recipes = Recipe.includes(:ingredients).all
      render :index
    end

    def new
      @recipe = Recipe.new
      @ingredients = Ingredient.all
      @ingredient = Ingredient.new
      render :new
    end

    def show
      @recipe = Recipe.find(params[:id])
      @ingredients = @recipe.ingredients
      render :show
    end

    private

    def recipe_params
      params.require(:recipe)
        .permit(:title, :body, :short_description, ingredient_ids: [])
    end
  end
end
