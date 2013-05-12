class RegisterClassController < ApplicationController
  #before_filter :authorize, :only => [ :create, :destroy]
  def new
    flash[:error] = "Invalid link"
    redirect_to root_path
  end
  
  def create
    if is_admin?
        destroy if params[:c_reg]
        @user = User.find_by(_id: params[:id])
        c_ids = params[:classes] 
    
        #update courses first
        c_ids.each do |id|
            course = Course.find_by(_id: id)
            course.user_ids.append(@user._id) unless course.user_ids.find_index(@user._id)
            r = course.update #assume that it always works
            #logger.info(r)
        end if c_ids
    
        @user.course_ids = c_ids if c_ids
     end
        respond_to do |format|
            if is_admin? && @user.save
                format.html { redirect_to @user, notice: 'Courses were successfully Assigned.' }
                format.json { render json: @user, status: :created, location: @user }
            else
                format.html { redirect_to @current_user, notice: 'failed to work' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    
  end
  
  def destroy 
    @user = User.find_by(_id: params[:id])
    c_ids = params[:c_reg] if params[:c_reg]
    
    c_ids.each do |id|
        course = Course.find_by(_id: id)
        course.user_ids.delete(@user._id) if course.user_ids.find_index(@user._id)
        course.update
        @user.course_ids.delete(id) if @user.course_ids.find_index(id)
    end
    if @user.update
        #nothing for now
        
    end
    
  end
  
  def helpme
    courses = Course.all 
    i = 10
    courses.each do |c|
       # usr = User.new(fname: c.description,  lname: "teach" + i.to_s,   email: "nshimiye" + i.to_s + "@yahoo.com",  username: "n" + i.to_s,    password: i  )
        usr = User.find_by(username: 'n' + i.to_s)
        ns = usr.fname.split(',') unless usr.nil?
        usr.fname = usr.lname unless usr.nil?
        usr.lname = usr.fname unless usr.nil?
        usr.status = "teacher" unless usr.nil?
        usr.password = 'n' + i.to_s unless usr.nil?
        uu = false
        uu = usr.update unless usr.nil?
        
        if uu
            
            #c.user_ids.append(usr._id) unless c.user_ids.find_index(usr._id)
            c.description = "This is a computer Science class"
            cc = c.update
            logger.info("<<<<<"+i.to_s+"--"+ cc.to_s + "--" + c.errors.to_s + ">>>>>")
            usr.course_ids.append(c._id) unless usr.course_ids.find_index(c._id)
            usr.update
        end
        i = i + 1
    end
  end
end


