class SessionsController < ApplicationController
  # assume this is to make sure only logged 
  before_filter :require_user, :only => [:new, :create]
  
  def new
  end

  def create
  
    respond_to do |format|
    
      user = User.find_by(email: params[:session][:email])
      if user #&& user.authenticate(params[:password])
        session[:user_id] = user.id
        format.html { redirect_to root_url, notice: 'you are in!!' }
      else
        #error
        #flash.now.alert = "Oops! something went wrong try again"
       format.html { render action: "new", notice: 'User was successfully updated.' }
      end
      
    end
         
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out'
  end
end
