module Api
  class RecipesController < ApiController
    def create
      result = YummlySession.recipe(recipe_params[:yummly_id])
      @recipe = Recipe.new(result)
      if @recipe.save
        render partial: "api/recipes/recipe", locals: { recipe: @recipe }
      else
        render @recipe.errors.full_messages
      end
    end

    def index
      @recipes = Recipe.all
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

    def search
      @ingredients = params[:ingredient_ids].map { |id| Ingredient.find(id).name }
      results = YummlySession.search(@ingredients)
      @recipes = results.map do |recipe|
        Recipe.find_by_yummly_id(recipe[:yummly_id]) || Recipe.new(recipe)
      end
      render :search
    end

    private

    def recipe_params
      params.require(:recipe)
        .permit(:credit, :title, :ingredients, :large_image_url, 
          :small_image_url, :source_recipe_url, :source_site_url, 
          :source_display_name, :yummly_id, :total_time, :total_time_in_seconds)
    end
  end
end
