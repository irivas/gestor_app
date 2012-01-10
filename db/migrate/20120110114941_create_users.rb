class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :nif
      t.string :email
      t.integer :phone
      t.string :address

      t.timestamps
    end
  end
  def self.down
    drop_table :users
  end
end
