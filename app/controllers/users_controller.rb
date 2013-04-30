class UsersController < ApplicationController
  # you can only signup if u not logged in
  skip_before_filter :require_user, :only => [:new, :create]
  before_filter :authorize, :only => [ :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    
    respond_to do |format|
      # unregistered users or admin can create new users
      if session[:user_id].nil? || User.find(session[:user_id]).status == 'admin'
        @user = User.new
    
        format.html # new.html.erb
        format.json { render json: @user }
      else
        @user = User.find(session[:user_id])
        format.html { redirect_to @user, notice: 'loged in as  ' + @user.lname  }
        format.json { render json: @user, status: :in, location: @user }
      end
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    

    respond_to do |format|
      # unregistered users or admin can create new users
      if session[:user_id].nil? || User.find(session[:user_id]).status == 'admin'
      
        @user = User.new(params[:user])
        if @user.save
          session[:user_id] = @user.id
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        @user = User
        format.html { redirect_to @user, notice: 'loged in as ' + @user.lname }
        format.json { render json: @user, status: :in, location: @user }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
