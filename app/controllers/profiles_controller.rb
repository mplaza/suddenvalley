class ProfilesController < ApplicationController
  def new
  	@profile = Profile.new
  	@user = User.find(session[:remember_token])
  end

  def create
  	@profile = Profile.create(params.require(:profile).permit(:username, :location, :bio, :user_id))
  	if @profile.save
  		flash[:success] = "Profile successfully created"
  		redirect_to topics_path
  	else
  		render 'new'
  	end
  end

  def show
    @current_user = User.find(session[:remember_token])
    @user_profile = Profile.where(:user_id => @current_user.id)
  end

  def edit
  end
end
