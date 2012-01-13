class CreateChargeCompetences < ActiveRecord::Migration
  def change
    create_table :charge_competences do |t|
      t.integer :competence_id
      t.integer :charge_id

      t.timestamps
    end
    ###### Creamos indice para hacer la busqueda mas rapida #########
	add_index :charge_competences, :charge_id
    add_index :charge_competences, :competence_id
  end
end
