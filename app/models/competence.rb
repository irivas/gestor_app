# == Schema Information
#
# Table name: competences
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  level      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Competence < ActiveRecord::Base
	attr_accessible :name, :level 
	
	validates :name,	:presence => true,
						:uniqueness => { :case_sensitive => false }
end
