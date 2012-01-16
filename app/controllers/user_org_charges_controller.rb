class UserOrgChargesController < ApplicationController

	before_filter :authenticate

	def new
		if @org = OrganicUnit.find(params[:organic_unit_id]) && params[:organic_unit_id]
			@user_org = UserOrgCharge.new
			@user_org.organic_unit_id = params[:organic_unit_id]
			@charges = Charge.all
			@users = User.all
		else
			render 'new'
		end
		
	end

	def create
		@users = params[:user_ids]
		@users.each do |user_id|
			UserOrgCharge.create(	:user_id => user_id, 
									:organic_unit_id => params[:user_org_charge][:organic_unit_id])
		end
		redirect_to organic_unit_path(params[:user_org_charge][:organic_unit_id])
	end





	private
		def authenticate
	  	deny_access unless signed_in?
		end  
end
