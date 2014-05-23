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
      if params[:ingredient_ids]
        @recipes = @recipes = Recipe.includes(:ingredients)
        .find_with_all_ingredients(params[:ingredient_ids])
      else
        @recipes = Recipe.includes(:ingredients).all
      end
      render :index
    end

    def update
      @recipe = Recipe.find(params[:id])
      if @recipe.update_attributes(recipe_params)
        render partial: "api/recipes/recipe", locals: { recipe: @recipe }
      else
        render @recipe.errors.full_messages
      end
    end

    def show
      @recipe = Recipe.find(params[:id])
      render partial: "api/recipes/recipe", locals: { recipe: @recipe }
    end

    private

    def recipe_params
      params.require(:recipe)
        .permit(:title, :body, :short_description, :image, ingredient_ids: [])
    end
  end
end
