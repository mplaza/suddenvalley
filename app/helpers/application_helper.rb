module ApplicationHelper
	def current_user
    	@current_user ||= session[:remember_token] && User.find(session[:remember_token])
  	end
  	def user_name
    	if Profile.where(:user_id => User.find(session[:remember_token]).id)[0].username != nil
        return Profile.where(:user_id => User.find(session[:remember_token]).id)[0].username
      else 
        return 'anonymous'
      end

  	end
  	def profile_id
      if current_user
        if Profile.where(:user_id => User.find(session[:remember_token]).id)[0].id != nil
          return Profile.where(:user_id => User.find(session[:remember_token]).id)[0].id
        else 
          return false
        end
      end
  	end
  	
 
end
