class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = User.find
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end
  
  helper_method :current_user
end
