class AddDescriptionToOrganicUnits < ActiveRecord::Migration
  def change
    add_column :organic_units, :description, :string
  end
end
