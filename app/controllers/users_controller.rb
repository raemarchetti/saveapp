class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

    private

  def user_params
    params.require(:user).permit(:name, :address, :phone_number, :email, :password)
  end
end
