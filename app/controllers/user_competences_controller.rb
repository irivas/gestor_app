class UserCompetencesController < ApplicationController

	before_filter :authenticate, :only => [:new, :edit, :update, :destroy]


	def new
		if @user = User.find(params[:user_id]) && params[:user_id]
			@user_competence = UserCompetence.new
			#Tiene el user_id en @user_competence.
			@user_competence.user_id = params[:user_id]
			#puts "el user_competence user_id es:"
			#puts @user_competence.user_id
			@competences = Competence.all
			#@user = User.find(params[:user_id])
		else
			render 'show'
		end
	end

	def create
    @user_competence = UserCompetence.new(params[:user_competence])
    if @user_competence.save
      	flash[:success] = "User competence created"
      	redirect_to user_path(@user_competence[:user_id])
    else
    	@user_competence = UserCompetence.new(params[:user_competence])
      render 'new'
    end
  end

	def edit
		@user_competence = UserCompetence.find(params[:id])
    @title = "Edit user competence"
	end

	def update
		@user_competence = UserCompetence.find(params[:id])
		@user = @user_competence.user
	    if @user_competence.update_attributes(params[:user_competence])
	      redirect_to @user, notice: 'User competence was successfully updated.'
	    else
	      @title = "Edit user competence"
	      render action: "edit" 
	    end
	end

	def destroy
		@user_competence = UserCompetence.find(params[:id])
		@user = @user_competence.user
		UserCompetence.find(params[:id]).destroy
		flash[:success] = "User competence deleted."
    redirect_to @user
	end

	private
		def authenticate
	  	deny_access unless signed_in?
		end  	

end
