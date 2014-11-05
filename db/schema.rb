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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140912170724) do

  create_table "ctl_cencontrolconfiguracions", force: true do |t|
    t.integer  "num_valor1",        default: 0
    t.string   "nom_valor2",        default: ""
    t.text     "des_descripcion",   default: ""
    t.integer  "account_number_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ctl_cencontrolconfiguracions", ["account_number_id"], name: "index_ctl_cencontrolconfiguracions_on_account_number_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "account_number",         default: 0,  null: false
    t.integer  "role",                   default: 0
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["account_number"], name: "index_users_on_account_number", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
