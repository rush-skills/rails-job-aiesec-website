class ApplicationController < ActionController::Base
  include PublicActivity::StoreController 
  protect_from_forgery
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  hide_action :current_user
  protected

  def auth_admin
      if session[:user_id]
        u = User.find(session[:user_id])
        if u.is_admin == 1
          return true
        else
          redirect_to(:controller => 'sessions', :action => 'home')
          return false
        end
      else
        redirect_to(:controller => 'sessions', :action => 'home')
        return false
      end
  end
  def authenticate_user
  	unless session[:user_id]
  		redirect_to(:controller => 'sessions', :action => 'login')
  		return false
  	else
      # set current_user by the current user object
      @current_user = User.find session[:user_id] 
  		return true
  	end
  end

  #This method for prevent user to access Signup & Login Page without logout
  def save_login_state
    if session[:user_id]
            redirect_to(:controller => 'sessions', :action => 'home')
      return false
    else
      return true
    end
  end
end
