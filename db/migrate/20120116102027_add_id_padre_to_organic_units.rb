class AddIdPadreToOrganicUnits < ActiveRecord::Migration
  def change
    add_column :organic_units, :id_padre, :integer
  end
end
