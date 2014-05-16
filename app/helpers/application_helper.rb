module ApplicationHelper
	def current_user
    	@current_user ||= session[:remember_token] && User.find(session[:remember_token])
  	end
  	def user_name
  	Profile.where(:user_id => User.find(session[:remember_token]).id)[0].username
  	end
  	
 
end
