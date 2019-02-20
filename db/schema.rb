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

ActiveRecord::Schema.define(version: 2019_02_19_165922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "appointment_date"
    t.string "location"
    t.bigint "user_id"
    t.bigint "nudie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nudie_id"], name: "index_appointments_on_nudie_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "nudies", force: :cascade do |t|
    t.integer "weight"
    t.integer "price"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_nudies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "username"
    t.integer "age"
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.boolean "admin"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "nudies", column: "nudie_id"
  add_foreign_key "appointments", "users"
  add_foreign_key "nudies", "users"
end
