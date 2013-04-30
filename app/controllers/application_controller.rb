class ApplicationController < ActionController::Base
  before_filter :require_user
  protect_from_forgery

private
  def current_user
    if @current_user.nil?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  helper_method :current_user  
  def require_user
    if current_user
      return true
    end
    redirect_to login_path
  end
  
  def authorize
  #to be fixed
    if @current_user && @current_user.status == 'admin'
       return true
    end
    flash[:error] = 'Need to administrative permission to do this'
    redirect_to root_path
  end

end
