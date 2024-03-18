# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_18_150036) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "compensation_trips", force: :cascade do |t|
    t.integer "status"
    t.bigint "compensation_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["compensation_id"], name: "index_compensation_trips_on_compensation_id"
    t.index ["trip_id"], name: "index_compensation_trips_on_trip_id"
  end

  create_table "compensations", force: :cascade do |t|
    t.string "name"
    t.integer "co2_absorption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transports", force: :cascade do |t|
    t.string "type"
    t.integer "duration"
    t.integer "distance"
    t.integer "co2_capacity"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_transports_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "departure"
    t.string "destination"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "compensation_trips", "compensations"
  add_foreign_key "compensation_trips", "trips"
  add_foreign_key "transports", "trips"
  add_foreign_key "trips", "users"
end
