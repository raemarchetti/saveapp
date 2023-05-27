class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user

    def edit
      @user = User.find(params[:id])
    end

    def update
      if @user.update(user_params)
        redirect_to edit_user_path, notice: 'User information was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:name, :address, :phone_number)
    end
  end

end
