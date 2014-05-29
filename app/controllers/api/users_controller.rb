module Api
  class UsersController < ApiController
    def show
      @user = current_user ? current_user : User.new
      render :show
    end

    def update
      if user_signed_in?
        @user = current_user
        if user_params[:saved_ingredient_ids] === ['empty']
          @user.update_attributes(saved_ingredient_ids: [])
        elsif user_params[:favorite_recipe_ids] === ['empty']
          @user.update_attributes(favorite_recipe_ids: [])
        else
          @user.update_attributes(user_params)
        end
      end
      render :show
    end

    private

    def user_params
      params.require(:user).permit(saved_ingredient_ids: [], favorite_recipe_ids: [])
    end
  end
end