module Api
  class UsersController < ApiController
    def show
      @user = current_user ? current_user : User.new
      render :show
    end

    def update
      if user_signed_in?
        @user = current_user
        @user.update_attributes(user_params)
      end
      render :show
    end

    private

    def user_params
      params.require(:user).permit(saved_ingredient_ids: [])
    end
  end
end