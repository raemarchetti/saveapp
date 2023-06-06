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

ActiveRecord::Schema[7.0].define(version: 2023_06_03_145459) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_cards", force: :cascade do |t|
    t.string "card_number"
    t.string "card_holder_name"
    t.string "expiration_date"
    t.string "cvv"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "goal_amount"
    t.decimal "goal_balance"
    t.string "goal_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "operations", force: :cascade do |t|
    t.decimal "operation_amount"
    t.date "operation_date"
    t.string "operation_origin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "credit_card_id"
    t.decimal "operation_ceil"
    t.decimal "roundup_amount"
    t.bigint "goal_id"
    t.index ["credit_card_id"], name: "index_operations_on_credit_card_id"
  end

  create_table "roundups", force: :cascade do |t|
    t.decimal "roundup_amount"
    t.decimal "transaction_amount"
    t.decimal "transaction_ceil"
    t.bigint "operation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_id"], name: "index_roundups_on_operation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "address"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "credit_cards", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "operations", "credit_cards"
  add_foreign_key "roundups", "operations"
end
