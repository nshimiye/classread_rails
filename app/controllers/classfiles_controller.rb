class ClassfilesController < ApplicationController
  # GET /classfiles
  # GET /classfiles.json
  def index
    @classfiles = Classfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classfiles }
    end
  end

  # GET /classfiles/1
  # GET /classfiles/1.json
  def show
    @classfile = Classfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classfile }
    end
  end

  # GET /classfiles/new
  # GET /classfiles/new.json
  def new
    @classfile = Classfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classfile }
    end
  end

  # GET /classfiles/1/edit
  def edit
    @classfile = Classfile.find(params[:id])
  end

  # POST /classfiles
  # POST /classfiles.json
  def create
    @classfile = Classfile.new(params[:classfile])

    respond_to do |format|
      if @classfile.save
        format.html { redirect_to @classfile, notice: 'Classfile was successfully created.' }
        format.json { render json: @classfile, status: :created, location: @classfile }
      else
        format.html { render action: "new" }
        format.json { render json: @classfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classfiles/1
  # PUT /classfiles/1.json
  def update
    @classfile = Classfile.find(params[:id])

    respond_to do |format|
      if @classfile.update_attributes(params[:classfile])
        format.html { redirect_to @classfile, notice: 'Classfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @classfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classfiles/1
  # DELETE /classfiles/1.json
  def destroy
    @classfile = Classfile.find(params[:id])
    @classfile.destroy

    respond_to do |format|
      format.html { redirect_to classfiles_url }
      format.json { head :no_content }
    end
  end
end
