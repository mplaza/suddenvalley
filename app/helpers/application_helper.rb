module ApplicationHelper
	def current_user
      if session[:remember_token] 
    	@current_user ||= session[:remember_token] && User.find(session[:remember_token])
      end 
  	end
  	def user_name
      if current_user
      	if Profile.where(:user_id => User.find(session[:remember_token]).id)[0] != nil
          return Profile.where(:user_id => User.find(session[:remember_token]).id)[0].username
        else 
          return 'anonymous'
        end
      else
        return 'anonymous'
      end
  	end
  	def profile_id
      if current_user
        if Profile.where(:user_id => User.find(session[:remember_token]).id)[0] != nil
          return Profile.where(:user_id => User.find(session[:remember_token]).id)[0].id
        else 
          return nil
        end
      end
  	end
  	
 
end
