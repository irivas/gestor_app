class UserCompetencesController < ApplicationController

	before_filter :authenticate#, :only => [:new, :edit, :update, :destroy]


	def new
		@user_competence = UserCompetence.new
		@competences = Competence.all
		if @user.nil?#, disponible por authenticate
			puts "usuario vacio"
		end
	end

	def create
    #params[:user_competence][:user_id] << @user.id
    @user_competence = UserCompetence.new(params[:user_competence])
    
    if @user_competence.save
      flash[:success] = "Organic unit created"
      redirect_to @user#, notice: 'Organic unit was successfully created.' 
    else
      render action: "new"
    end
  end

	def edit
		@user_competence = UserCompetence.find(params[:id])
    @title = "Edit user competence"
	end

	def update
		@user_competence = UserCompetence.find(params[:id])
	    if @user_competence.update_attributes(params[:user_competence])
	      redirect_to @user_competence, notice: 'User competence was successfully updated.'
	    else
	      @title = "Edit user competence"
	      render action: "edit" 
	    end
	end

	def destroy
		UserCompetence.find(params[:id]).destroy
    flash[:success] = "User competence deleted."
    redirect_to user_competences_path
	end

	private
		def authenticate
	  	deny_access unless signed_in?
		end  	

end
