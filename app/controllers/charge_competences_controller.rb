class ChargeCompetencesController < ApplicationController

	before_filter :authenticate, :only => [:new, :edit, :update, :destroy]


	def new
		if @charge = Charge.find(params[:charge_id]) && params[:charge_id]
			@charge_competence = ChargeCompetence.new
			#Tiene el user_id en @user_competence.
			@charge_competence.charge_id = params[:charge_id]
			#puts "el user_competence user_id es:"
			#puts @user_competence.user_id
			@competences = Competence.all
			#@user = User.find(params[:user_id])
		else
			render 'new'
		end
		
	end

	def create
		@competences = params[:competence_ids]
		@competences.each do |c|
			ChargeCompetence.create(	:competence_id => c, 
																:charge_id => params[:charge_competence][:charge_id])
		end
		redirect_to charge_path(params[:charge_competence][:charge_id])
	end

	def destroy
		@charge_competence = ChargeCompetence.find(params[:id])
		@charge = @charge_competence.charge
		ChargeCompetence.find(params[:id]).destroy
		flash[:success] = "Charge competence deleted."
    redirect_to @charge
		
	end


	private
		def authenticate
	  	deny_access unless signed_in?
		end  	
end
