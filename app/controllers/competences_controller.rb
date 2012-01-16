class CompetencesController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  
  
	def index
		@competences = Competence.search(params[:search]).paginate(:per_page => 2, :page => params[:page])
    @title = "Competences"
	end

	def new
		@competence = Competence.new
	end

	def create
		@competence = Competence.new(params[:competence])
		if @competence.save
      flash[:success] = "Competence created"
      redirect_to @competence#, notice: 'Organic unit was successfully created.' 
    else
      render 'new'
    end
	end

	def show
    @competence = Competence.find(params[:id])
    @title = "Competence"
    @charges = @competence.charges
  end

  def edit
  	@competence = Competence.find(params[:id])
  	@title = "Edit competence"
  end

  def update
  	@competence = Competence.find(params[:id])
  	if @competence.update_attributes(params[:competence])
      flash[:success] = "Competence updated."
      redirect_to @competence
    else
      @title = "Edit competence"
      render 'edit'
    end
  end

  def destroy
  	Competence.find(params[:id]).destroy
    flash[:success] = "Competence deleted."
    redirect_to competences_path
  end


	private
		def authenticate
	  	deny_access unless signed_in?
		end  	
end
