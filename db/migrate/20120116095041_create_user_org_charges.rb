class CreateUserOrgCharges < ActiveRecord::Migration
  def change
    create_table :user_org_charges do |t|
      t.integer :user_id
      t.integer :organic_unit_id
      t.integer :charge_id

      t.timestamps
    end
    add_index :user_org_charges, :user_id
    add_index :user_org_charges, :organic_unit_id
    add_index :user_org_charges, :charge_id
  end
end
