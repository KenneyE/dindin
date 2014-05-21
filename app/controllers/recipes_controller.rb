class RecipesController < ApplicationController
  before_action :ensure_signed_in

  def index
    @recipes = Recipe.all
    render :index
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, ingredient_ids: [])
  end

  def ensure_signed_in
    redirect_to new_user_session_url unless user_signed_in?
  end
end
