class ChargesController < ApplicationController
  # GET /charges
  # GET /charges.json
  def index
    @title = "Listado de cargos"
    @charges = Charge.search(params[:search]).paginate(:per_page => 2, :page => params[:page])
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
    @charge = Charge.find(params[:id])
    @competences = @charge.competences
    @title = "Cargo"
    
  end

  # GET /charges/new
  # GET /charges/new.json
  def new
    @charge = Charge.new
  end

  # GET /charges/1/edit
  def edit
    @charge = Charge.find(params[:id])
  end

  # POST /charges
  # POST /charges.json
  def create
    @charge = Charge.new(params[:charge])
    if @charge.save
      redirect_to @charge, notice: 'Charge was successfully created.' 
    else
      render action: "new"
    end
  end

  # PUT /charges/1
  # PUT /charges/1.json
  def update
    @charge = Charge.find(params[:id])
    if @charge.update_attributes(params[:charge])
      redirect_to @charge, notice: 'Charge was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy
    redirect_to charges_url
  end
end
