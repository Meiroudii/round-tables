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

ActiveRecord::Schema[8.1].define(version: 2026_01_14_075617) do
  create_table "round_table_memberships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "joined_round_table_id"
    t.integer "member_id"
    t.datetime "updated_at", null: false
    t.index ["joined_round_table_id"], name: "index_round_table_memberships_on_joined_round_table_id"
    t.index ["member_id", "joined_round_table_id"], name: "idx_on_member_id_joined_round_table_id_019f3985b9", unique: true
    t.index ["member_id"], name: "index_round_table_memberships_on_member_id"
  end

  create_table "round_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "founder_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["founder_id"], name: "index_round_tables_on_founder_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
