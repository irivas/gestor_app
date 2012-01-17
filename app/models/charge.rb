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

	#############################################################
  ###################### Relationships ########################
  has_many :charge_competences, :dependent => :destroy
  has_many :competences, :through => :charge_competences
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
