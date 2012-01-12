# == Schema Information
#
# Table name: organic_units
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#

class OrganicUnit < ActiveRecord::Base
	attr_accessible :name, :description 

	validates :name,	:presence => true,
						:uniqueness => { :case_sensitive => false }
end
