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
		@charges = params[:charge_ids]
		@charges.each do |charge|
			if charge.empty?
				@charges.delete(charge)
			end
		end
		@charges = @charges.reverse
		@users.each do |user_id|
			@charge = @charges.pop
			UserOrgCharge.create(	:user_id => user_id,
														:charge_id => @charge, 
									:organic_unit_id => params[:user_org_charge][:organic_unit_id])
		end
		redirect_to organic_unit_path(params[:user_org_charge][:organic_unit_id])
	end

	def edit
		@user_org_charge = UserOrgCharge.find(params[:id]) 
			puts "DATOS DE USER_ORG_CHARGE:"
			puts "iD RELACION:"
			puts @user_org_charge.id
			puts "USER iD:"
			puts @user_org_charge.user_id
			puts "CHARGE iD:"
			puts @user_org_charge.charge_id

			@charges = Charge.all
		
	end

	def update
		@user_org_charge = UserOrgCharge.find(params[:id])
		@org = @user_org_charge.organic_unit
		if @user_org_charge.update_attribute(
							:charge_id, params[:user_org_charge][:charge_id])
			redirect_to @org, notice: 'Member charge was successfully updated.'
		else
			redirect_to @org, notice: 'Impossible to update member charge'
		end
	end








	def destroy
		@user_org_charge = UserOrgCharge.find(params[:id])
		@organic_unit = @user_org_charge.organic_unit
		UserOrgCharge.find(params[:id]).destroy
		flash[:success] = "Member deleted."
    redirect_to @organic_unit
	end



	private
		def authenticate
	  	deny_access unless signed_in?
		end  
end
