class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    binding.pry
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update(user_params)
      flash[:success] = "User status changed!"
      redirect_to @user
    else
      flash.now[:danger] = "Invalid information."
      render 'edit'
      binding.pry
    end
  end

  protected
  def user_params
    params.require(:user).permit(:status, :_update)
  end

end
