class AssignementsController < ApplicationController
  # GET /assignements
  # GET /assignements.json
  def index
    @assignements = Assignement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignements }
    end
  end

  # GET /assignements/1
  # GET /assignements/1.json
  def show
    @assignement = Assignement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignement }
    end
  end

  # GET /assignements/new
  # GET /assignements/new.json
  def new
    @assignement = Assignement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignement }
    end
  end

  # GET /assignements/1/edit
  def edit
    @assignement = Assignement.find(params[:id])
  end

  # POST /assignements
  # POST /assignements.json
  def create
    @assignement = Assignement.new(params[:assignement])

    respond_to do |format|
      if @assignement.save
        format.html { redirect_to @assignement, notice: 'Assignement was successfully created.' }
        format.json { render json: @assignement, status: :created, location: @assignement }
      else
        format.html { render action: "new" }
        format.json { render json: @assignement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignements/1
  # PUT /assignements/1.json
  def update
    @assignement = Assignement.find(params[:id])

    respond_to do |format|
      if @assignement.update_attributes(params[:assignement])
        format.html { redirect_to @assignement, notice: 'Assignement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignements/1
  # DELETE /assignements/1.json
  def destroy
    @assignement = Assignement.find(params[:id])
    @assignement.destroy

    respond_to do |format|
      format.html { redirect_to assignements_url }
      format.json { head :no_content }
    end
  end
end
