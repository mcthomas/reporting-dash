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

ActiveRecord::Schema[7.0].define(version: 2022_12_08_042531) do
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

  create_table "eligibilitylists", force: :cascade do |t|
    t.string "title"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.string "q4"
    t.string "q5"
    t.string "q6"
    t.string "q7"
    t.string "q8"
    t.string "q9"
    t.string "q10"
    t.string "string"
    t.boolean "a1"
    t.boolean "a2"
    t.boolean "a3"
    t.boolean "a4"
    t.boolean "a5"
    t.boolean "a6"
    t.boolean "a7"
    t.boolean "a8"
    t.boolean "a9"
    t.boolean "a10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "elgibilitylists", "entries"
end
