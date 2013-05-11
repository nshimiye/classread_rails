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
    if @current_user && is_admin?
       return true
    end
    flash[:error] = 'Need to admin permission to do this'
    redirect_to root_path
  end
  
  ## create filter for role attr
  helper_method :is_admin?
  def is_admin?
    return @current_user && @current_user.status == 'admin'
  end
  
  helper_method :is_teacher?
  def is_teacher?
    return @current_user && @current_user.status == 'teacher'
  end
  
end
