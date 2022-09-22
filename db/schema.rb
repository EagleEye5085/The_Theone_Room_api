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

ActiveRecord::Schema.define(version: 2022_09_14_210909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.integer "cleanliness"
    t.integer "ambiance"
    t.integer "tp_quality"
    t.integer "privacy"
    t.integer "accessibility"
    t.integer "user_id"
    t.string "other_comments"
    t.bigint "throne_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["throne_room_id"], name: "index_reviews_on_throne_room_id"
  end

  create_table "throne_rooms", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "directions"
    t.integer "baby_changing_station"
    t.integer "bathroom_style"
    t.integer "key_code_required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reviews", "throne_rooms"
end
