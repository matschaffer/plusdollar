class PledgesController < ApplicationController
   before_filter :authenticate_user!

  before_filter do
        @users = User.all
  end
  
  def pledges
    current_user.pledges
  end
  
  # GET /pledges
  # GET /pledges.json
  def index
    @pledges = pledges

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pledges }
    end
  end

  # GET /pledges/1
  # GET /pledges/1.json
  def show
    @pledge = Pledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pledge }
    end
  end

  # GET /pledges/new
  # GET /pledges/new.json
  def new
    @pledge = pledges.build
    
    @users = User.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pledge }
    end
  end

  # GET /pledges/1/edit
  def edit
    @pledge = pledges.find(params[:id])
    @users = User.all
  end

  # POST /pledges
  # POST /pledges.json
  def create
    @pledge = pledges.new(params[:pledge])


    respond_to do |format|
      if @pledge.save
        format.html { redirect_to @pledge, notice: 'Pledge was successfully created.' }
        format.json { render json: @pledge, status: :created, location: @pledge }
      else
        format.html { render action: "new" }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pledges/1
  # PUT /pledges/1.json
  def update
    @pledge = pledges.find(params[:id])

      if @pledge.update_attributes(params[:pledge])
        redirect_to @pledge, notice: 'Pledge was successfully updated.'
      else
        render action: "edit"
      end
  end

  # DELETE /pledges/1
  # DELETE /pledges/1.json
  def destroy
    @pledge = pledges.find(params[:id])
    @pledge.destroy

    respond_to do |format|
      format.html { redirect_to pledges_url }
      format.json { head :no_content }
    end
  end
end
