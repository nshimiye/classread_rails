class SessionController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  def new
    flash[:error] = "Invalid link"
    redirect_to in_path
  end

  def create
    user = nil
    user = User.find_by(username: params[:usern]) if params[:usern]
    user = User.find_by(email: params[:usern]) if user.nil?
    user = User.find_by(username: params[:session][:usern]) if user.nil? && params[:session]
    user = User.find_by(email: params[:session][:usern]) if user.nil? && params[:session]
    
    pass = nil
    pass = user.authenticate(params[:password]) unless user.nil? 
    pass = user.authenticate(params[:session][:password]) if pass.nil? && params[:session]
    if user && pass
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to courses_path 
    else
      flash[:error] = "Invalid login information"
      redirect_to in_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully!"
    redirect_to root_url
  end

end
