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

ActiveRecord::Schema[7.0].define(version: 2024_10_01_072247) do
  create_table "logs", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date", null: false
    t.integer "reps", null: false
    t.integer "duration", null: false
    t.text "memo"
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "calories_burned"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "profiles", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "height"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weights", charset: "utf8", force: :cascade do |t|
    t.float "weight", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.float "goal_weight"
    t.index ["user_id"], name: "index_weights_on_user_id"
  end

  add_foreign_key "logs", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "weights", "users"
end
