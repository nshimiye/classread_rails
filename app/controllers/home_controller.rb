class HomeController < ApplicationController
  
   before_filter :require_user, :only => [:new, :create]
  
  def index
  end

  def show
    @user = User.first
  end
  
end
