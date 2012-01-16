# == Schema Information
#
# Table name: user_org_charges
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  organic_unit_id :integer
#  charge_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class UserOrgCharge < ActiveRecord::Base

	attr_accessible :user_id, :organic_unit_id, :charge_id

	belongs_to :user
	belongs_to :organic_unit
  belongs_to :charge

  validates :user_id, 				:presence => true
  validates :organic_unit_id, 		:presence => true
  validates_uniqueness_of :user_id, :scope => [:organic_unit_id]
  

end
