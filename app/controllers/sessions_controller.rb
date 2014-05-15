class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.where(:email => params[:session][:email]).first
  	if @user == nil
  		flash[:error] = "Invalid email/password combination"
  		render 'new'
  	elsif !@user.authenticate(params[:session][:password])
  		flash[:error] = "Invalid email/password combination"
  		render 'new'
  	else
      # it doesnt have to be remember token it could be :user_id or something else
  		session[:remember_token] = @user.id
  		@current_user = @user
  		redirect_to topics_path
  	end
  end

  def destroy
  	session.delete(:remember_token)
  	redirect_to new_sessions_path
  end
end
