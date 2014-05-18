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
   @profile = Profile.find(params[:id])
  end

  def edit
    @current_user = User.find(session[:remember_token])
    @profile = Profile.where(:user_id => @current_user.id)
  end

  def update
    @current_user = User.find(session[:remember_token])
    @profile = Profile.where(:user_id => @current_user.id)
    if @profile.update(params.require(:profile).permit(:username, :location, :bio, :user_id))
      flash[:success] = "Your profile was successfully updated"
      redirect_to topics_path
    else 
      render 'new'
    end
  end
end
