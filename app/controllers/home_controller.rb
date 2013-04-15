class HomeController < ApplicationController
  
   before_filter :require_user, :only => [:new, :create]
  
  def index
   @user = User.first
  end

  def show
    @user = User.first
  end
  
private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
