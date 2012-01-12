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

	#############################################################
  ###################### Relationships ########################
  has_many :user_competences 
  has_many :users, :through => :user_competences
	## el dependent es para que cuando se elimine una competencia
	## automaticamente se eliminen las entradas de la tabla de 
	## la relacion en las que participe.                              
  #############################################################
  #############################################################
end
