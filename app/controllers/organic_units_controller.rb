class OrganicUnitsController < ApplicationController

  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]

  # GET /organic_units
  # GET /organic_units.json
  def index
    @organic_units = OrganicUnit.search(params[:search]).paginate(:per_page => 2, :page => params[:page])
    @title = "Organic Units"
  end

  # GET /organic_units/new
  # GET /organic_units/new.json
  def new
    @title = "New Organic Unit"
    @organic_unit = OrganicUnit.new
    @units = OrganicUnit.all

  end

  # POST /organic_units
  # POST /organic_units.json
  def create
    @organic_unit = OrganicUnit.new(params[:organic_unit])
    if @organic_unit.save
      flash[:success] = "Organic unit created"
      redirect_to @organic_unit#, notice: 'Organic unit was successfully created.' 
    else
      render action: "new"
    end
  end
    
  # GET /organic_units/1
  # GET /organic_units/1.json
  def show
    @organic_unit = OrganicUnit.find(params[:id])
    @title = @organic_unit.name
    @users = @organic_unit.users
  end

  # GET /organic_units/1/edit
  def edit
    @organic_unit = OrganicUnit.find(params[:id])
    @title = "Edit organic unit"
  end

  # PUT /organic_units/1
  # PUT /organic_units/1.json
  def update
    @organic_unit = OrganicUnit.find(params[:id])
    if @organic_unit.update_attributes(params[:organic_unit])
      redirect_to @organic_unit, notice: 'Organic unit was successfully updated.'
    else
      @title = "Edit organic unit"
      render action: "edit" 
    end
  end

  # DELETE /organic_units/1
  # DELETE /organic_units/1.json
  def destroy
    OrganicUnit.find(params[:id]).destroy
    flash[:success] = "Org unit deleted."
    redirect_to organic_units_url
  end


  private
    def authenticate
      deny_access unless signed_in?
    end   
end
