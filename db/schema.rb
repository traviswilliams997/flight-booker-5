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

ActiveRecord::Schema[7.0].define(version: 2023_07_09_045556) do
  create_table "airports", force: :cascade do |t|
    t.string "Code"
    t.string "City"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Code"], name: "index_airports_on_Code", unique: true
  end

  create_table "flights", force: :cascade do |t|
    t.date "Date"
    t.time "Time"
    t.integer "Duration"
    t.integer "DepartureAirport_id", null: false
    t.integer "DestinationAirport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["DepartureAirport_id"], name: "index_flights_on_DepartureAirport_id"
    t.index ["DestinationAirport_id"], name: "index_flights_on_DestinationAirport_id"
  end

  add_foreign_key "flights", "airports", column: "DepartureAirport_id"
  add_foreign_key "flights", "airports", column: "DestinationAirport_id"
end