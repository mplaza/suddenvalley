class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up successfully"
      session[:remember_token] = @user.id
      @current_user = @user
      redirect_to topics_path
    else
      flash[:danger] = "Sign up not successful"
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :notoffending)
  end
end
