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

ActiveRecord::Schema.define(version: 2021_12_05_132334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expanse_payments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "expanse_id", null: false
    t.bigint "paid_by_id", null: false
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expanse_id"], name: "index_expanse_payments_on_expanse_id"
    t.index ["user_id"], name: "index_expanse_payments_on_user_id"
  end

  create_table "expanses", force: :cascade do |t|
    t.string "title"
    t.decimal "amount"
    t.string "type"
    t.boolean "status", default: false
    t.bigint "paid_by_id"
    t.bigint "created_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_friends", force: :cascade do |t|
    t.bigint "receiver_id", null: false
    t.bigint "sender_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "mobile_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expanse_payments", "expanses"
  add_foreign_key "expanse_payments", "users"
end
