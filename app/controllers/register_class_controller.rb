class RegisterClassController < ApplicationController
  before_filter :authorize, :only => [ :create, :destroy]
  def new
  end
  
  def create
    @user = User.find_by(_id: params[:id])
    c_ids = params[:classes]
    
    #update courses first
    c_ids.each do |id|
        course = Course.find_by(_id: id)
        course.user_ids.append(@user.id) unless course.user_ids.find_index(@user.id)
        r = course.update #assume that it always works
        logger.info(r)
    end
    
    @user.course_ids = c_ids
    
    respond_to do |format|
        if @user.save
            format.html { redirect_to @user, notice: 'Courses were successfully Assigned.' }
            format.json { render json: @user, status: :created, location: @user }
        else
            format.html { redirect_to @current_user, notice: 'failed to work' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
  
  end
end
