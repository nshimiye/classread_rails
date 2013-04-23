class SessionController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  def new
  end

  def create
    user = User.find_by(username: params[:session][:usern])
    user = User.find_by(email: params[:session][:usern]) if user.nil?
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to courses_path, notice: "Logged in!"
    else
      flash.now[:error] = "Invalid login information"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end