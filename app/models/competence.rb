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
  has_many :user_competences, :dependent => :destroy
  has_many :users, :through => :user_competences
	## el dependent es para que cuando se elimine una competencia
	## automaticamente se eliminen las entradas de la tabla de 
	## la relacion en las que participe.                              
  #############################################################
  #############################################################
  has_many :charge_competences#, :nullify
  has_many :charges, :through => :charge_competences
	## el dependent es para que cuando se elimine una competencia
	## automaticamente se eliminen las entradas de la tabla de 
	## la relacion en las que participe.                              
  #############################################################
  #############################################################

  def self.search(search)
    if search
      #all(:conditions => ['name LIKE ?', "%#{search}%"])
      where('name LIKE ?', "%#{search}%")
    else
      #all
      scoped
    end
  end

  
end
