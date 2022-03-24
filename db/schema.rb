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

ActiveRecord::Schema[7.0].define(version: 2022_03_24_015248) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exams", force: :cascade do |t|
    t.string "title", null: false
    t.date "date", null: false
    t.string "exam_location", null: false
    t.bigint "medical_appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_appointment_id"], name: "index_exams_on_medical_appointment_id"
  end

  create_table "medical_appointments", force: :cascade do |t|
    t.string "title", null: false
    t.string "professional_name", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.date "date"
    t.string "treatment_location"
    t.integer "kind"
    t.bigint "medical_appointment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_appointment_id"], name: "index_treatments_on_medical_appointment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.string "cell_phone"
    t.integer "kind", default: 1
    t.string "crm"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "exams", "medical_appointments"
  add_foreign_key "treatments", "medical_appointments"
end
