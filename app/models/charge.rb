# == Schema Information
#
# Table name: charges
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Charge < ActiveRecord::Base

	attr_accessible :name

	validates :name,	:presence => true,
						:uniqueness => { :case_sensitive => false }
						
	has_and_belongs_to_many :competences, :uniq => true
end
