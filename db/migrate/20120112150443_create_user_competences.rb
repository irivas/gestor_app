class CreateUserCompetences < ActiveRecord::Migration
  def self.up
    create_table :user_competences do |t|
      t.integer :user_id
      t.integer :competence_id
      t.string :level

      t.timestamps
    end
    
    ###### Creamos indice para hacer la busqueda mas rapida #########
	add_index :user_competences, :user_id
    add_index :user_competences, :competence_id
    #################################################################

    ########################################################################
    ########## Para que un usuario solo tenga una competencia una vez ######
    add_index :user_competences, [:user_id, :competence_id], :unique => true
    ########################################################################
  end
  def self.down
  	drop_table :user_competences
  end
end
