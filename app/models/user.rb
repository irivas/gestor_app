# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  surname            :string(255)
#  nif                :string(255)
#  email              :string(255)
#  phone              :integer
#  address            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean         default(FALSE)
#

require 'digest'
class User < ActiveRecord::Base

	attr_accessor :password, :password_confirmation, :set_the_password, :old_password

	attr_accessible :name, :surname, :nif, :email, :phone, :address,
					:password, :password_confirmation, :old_password

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name,	:presence => true,
						:length => { :maximum => 50 }

	validates :surname,	:presence => true,
						:length => { :maximum => 50 }
	
	validates :email, 	:presence => true,
						:format => { :with => email_regex },
						:uniqueness => { :case_sensitive => false }
	
	validates  :password,	:presence => true, 
							:confirmation => true,
							:length => { :within => 6..40 },
              :on => :create

	before_save :encrypt_password

  #############################################################
  ################# Relationships #############################
  has_many :user_competences#, :dependent => :nullify
  has_many :competences, :through => :user_competences
  ## el dependent es para que cuando se elimine un usuario
  ## automaticamente se eliminen las entradas de la tabla de 
  ## la relacion en las que participe.                              
  #############################################################
  #############################################################


  #para la busqueda de usuarios
  def self.search(search)
    if search
      #all(:conditions => ['name LIKE ?', "%#{search}%"])
      where('name LIKE ?', "%#{search}%")
    else
      #all
      scoped
    end
  end

  def has_password?(submitted_password)
    	encrypted_password == encrypt(submitted_password)
  	end

  	def self.authenticate(email, submitted_password)
    	user = find_by_email(email)
    	return nil  if user.nil?
    	return user if user.has_password?(submitted_password)
  	end

  	def self.authenticate_with_salt(id, cookie_salt)
  		user = find_by_id(id)
  		(user && user.salt == cookie_salt) ? user : nil
  	end

    ######################################################
    ############### Para competences #####################
    ######################################################
    
    #######Devuelve las competence de user dado el id#####
    #def competences#(user)
      #user = find_by_id(id)
     # competences
    #end
    ######################################################
    ######################################################
    #######Comprueba si tiene competencias ###############
    def competences?#(user)
      #user = find_by_id(id)
      competences.all.empty?
    end
    ######################################################
    ######################################################
    ####Crea una entrada en la tabla relacion competencia#
    def crea_competencia(id_competencia, nivel)
      #user = find_by_id(id)
      competences.create(:competencia_id => id_competencia,
                              :level => nivel)
    end
    ######################################################
    ####Elimina competencia del usuario###################
    def elimina_competencia(id_competencia)
      #user = find_by_id(id)
      competences.find_by_id(id_competencia).destroy
    end
    ######################################################
    ####Modifica el nivel en una competencia##############
    def modifica_nivel_competencia(id_competencia, nivel)
      competences.find_by_id(id_competencia).update_attribute(:level, nivel)
    end
    ######################################################


    ######################################################

  private
    
    def encrypt_password

      if self.set_the_password
        self.salt = make_salt unless has_password?(password)
        self.encrypted_password = encrypt(password)
      end
    end
    

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
