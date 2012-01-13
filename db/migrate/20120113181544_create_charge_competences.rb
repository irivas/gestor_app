class CreateChargeCompetences < ActiveRecord::Migration
  def change
    create_table :charge_competences do |t|
      t.integer :competence_id
      t.integer :charge_id

      t.timestamps
    end
  end
end
