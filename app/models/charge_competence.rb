# == Schema Information
#
# Table name: charge_competences
#
#  id            :integer         not null, primary key
#  competence_id :integer
#  charge_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class ChargeCompetence < ActiveRecord::Base

	attr_accessible :charge_id, :competence_id
	
	###################################################
	###################################################
	# con esto decimos a quien pertenece esta relacion.
	belongs_to :charge
  	belongs_to :competence
  	###################################################
  	###################################################

  	validates :charge_id, 		:presence => true
  	validates :competence_id, 	:presence => true
  	#validates_uniqueness_of :user_id, :scope => [:competence_id]
end
