# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120113182906) do

  create_table "charge_competences", :force => true do |t|
    t.integer  "competence_id"
    t.integer  "charge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charge_competences", ["charge_id"], :name => "index_charge_competences_on_charge_id"
  add_index "charge_competences", ["competence_id"], :name => "index_charge_competences_on_competence_id"

  create_table "charges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competences", :force => true do |t|
    t.string   "name"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organic_units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "user_competences", :force => true do |t|
    t.integer  "user_id"
    t.integer  "competence_id"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_competences", ["competence_id"], :name => "index_user_competences_on_competence_id"
  add_index "user_competences", ["user_id", "competence_id"], :name => "index_user_competences_on_user_id_and_competence_id", :unique => true
  add_index "user_competences", ["user_id"], :name => "index_user_competences_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "nif"
    t.string   "email"
    t.integer  "phone"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
