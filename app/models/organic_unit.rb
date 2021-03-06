# == Schema Information
#
# Table name: organic_units
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#  id_padre    :integer
#

class OrganicUnit < ActiveRecord::Base
	attr_accessible :name, :description, :id_padre

	validates :name,	:presence => true,
						:uniqueness => { :case_sensitive => false }

	has_many 		:org_sons, 	:class_name => "OrganicUnit"
	belongs_to 	:org_father, :class_name => "OrganicUnit",
							:foreign_key => "org_father_id"

	has_many :user_org_charges, :dependent => :destroy
  has_many :charges,          :through => :user_org_charges
  has_many :users,    				:through => :user_org_charges 	
  
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
