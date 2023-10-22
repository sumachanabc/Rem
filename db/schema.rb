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

ActiveRecord::Schema[7.0].define(version: 2023_10_22_054539) do
  create_table "active_admin_comments", charset: "utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "condo_users", charset: "utf8", force: :cascade do |t|
    t.integer "room_number", null: false
    t.string "condo_user_last_name", null: false
    t.string "condo_user_first_name", null: false
    t.string "condo_user_last_name_kana", null: false
    t.string "condo_user_first_name_kana", null: false
    t.string "condo_user_address", null: false
    t.string "condo_user_phone_number", null: false
    t.bigint "condo_id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condo_id"], name: "index_condo_users_on_condo_id"
    t.index ["email"], name: "index_condo_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_condo_users_on_reset_password_token", unique: true
  end

  create_table "condos", charset: "utf8", force: :cascade do |t|
    t.string "condo_name", null: false
    t.string "postal_code", null: false
    t.string "condo_address", null: false
    t.integer "floor", null: false
    t.integer "basement_floor"
    t.integer "total_number_of_unit", null: false
    t.integer "completion_year", null: false
    t.string "structure_id", null: false
    t.float "site_area", null: false
    t.float "total_floor_area", null: false
    t.integer "parking_space"
    t.integer "bicycle_parking_space"
    t.float "maintenance_fee", null: false
    t.float "repair_reserve_fund", null: false
    t.string "management_company_name", null: false
    t.string "management_company_postal_code", null: false
    t.string "management_company_address", null: false
    t.string "management_company_phone_number", null: false
    t.string "management_type_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_condos_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "condo_users", "condos"
  add_foreign_key "condos", "users"
end
