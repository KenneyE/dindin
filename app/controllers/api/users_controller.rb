module Api
  class UsersController < ApiController
    def show
      @user = User.find(params[:id])
      render :show
    end

    private

    def user_params
      params.require(:user).permit(:ingredient_ids[])
    end
  end
end