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

ActiveRecord::Schema.define(version: 20170613233056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "city_start_id"
    t.bigint "station_start_id"
    t.datetime "date_start"
    t.bigint "city_end_id"
    t.bigint "station_end_id"
    t.datetime "date_end"
    t.bigint "carrier_id"
    t.money "cost", scale: 2
    t.integer "currency", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_routes_on_carrier_id"
    t.index ["city_end_id"], name: "index_routes_on_city_end_id"
    t.index ["city_start_id"], name: "index_routes_on_city_start_id"
    t.index ["station_end_id"], name: "index_routes_on_station_end_id"
    t.index ["station_start_id"], name: "index_routes_on_station_start_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_stations_on_city_id"
  end

  add_foreign_key "routes", "carriers"
  add_foreign_key "routes", "cities", column: "city_end_id"
  add_foreign_key "routes", "cities", column: "city_start_id"
  add_foreign_key "routes", "stations", column: "station_end_id"
  add_foreign_key "routes", "stations", column: "station_start_id"
  add_foreign_key "stations", "cities"
end
