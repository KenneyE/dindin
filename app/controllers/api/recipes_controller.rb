module Api
  class RecipesController < ApiController
    def create
      @recipe = Recipe.new(recipe_params)
      @recipe.author_id = current_user.id
      if @recipe.save
        render partial: "api/recipes/recipe", locals: { recipe: @recipe }
      else
        render @recipe.errors.full_messages
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
      render partial: "api/recipes/recipe", locals: { recipe: @recipe }
    end

    private

    def recipe_params
      params.require(:recipe)
        .permit(:title, :body, :short_description, ingredient_ids: [])
    end
  end
end
