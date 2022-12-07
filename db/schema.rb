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

ActiveRecord::Schema[7.0].define(version: 2022_12_07_005729) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channelplans", force: :cascade do |t|
    t.string "channel"
    t.string "name"
    t.string "structure"
    t.string "tone"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elgibilitylists", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "entry_id"
    t.index ["entry_id"], name: "index_elgibilitylists_on_entry_id"
  end

  create_table "entries", force: :cascade do |t|
    t.string "scenario"
    t.boolean "check"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "elgibilitylist_id"
    t.index ["elgibilitylist_id"], name: "index_entries_on_elgibilitylist_id"
  end

  create_table "userreports", force: :cascade do |t|
    t.integer "users"
    t.integer "usersactive"
    t.integer "usersinactive"
    t.integer "usersvalidated"
    t.integer "usersnotvalidated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "elgibilitylists", "entries"
end
