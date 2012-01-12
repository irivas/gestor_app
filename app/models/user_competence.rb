# == Schema Information
#
# Table name: user_competences
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  competence_id :integer
#  level         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class UserCompetence < ActiveRecord::Base

	attr_accessible :user_id, :competence_id, :level
	
	###################################################
	###################################################
	# con esto decimos a quien pertenece esta relacion.
	belongs_to :user#, 			:class_name => "User"
  belongs_to :competence#, :class_name => "Competence"
  ###################################################
  ###################################################

  validates :user_id, 			:presence => true
  validates :competence_id, :presence => true
  validates :level, 			:presence => true

end
