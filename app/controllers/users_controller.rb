class UsersController < ApplicationController
  def index
    @novices = Novice.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User status changed!"
      redirect_to action: 'index'
    else
      flash.now[:danger] = "Invalid information."
      render 'edit'
    end
  end

  protected
  def user_params
    params.require(:novice).permit(:status, :_update)
  end

end
