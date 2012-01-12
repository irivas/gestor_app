class CreateOrganicUnits < ActiveRecord::Migration
  def change
    create_table :organic_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
