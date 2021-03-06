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

ActiveRecord::Schema[7.0].define(version: 2022_04_03_203357) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "exams", force: :cascade do |t|
    t.string "title", null: false
    t.date "date", null: false
    t.string "exam_location", null: false
    t.bigint "medical_appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["medical_appointment_id"], name: "index_exams_on_medical_appointment_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "medical_appointments", force: :cascade do |t|
    t.string "title", null: false
    t.string "professional_name", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_medical_appointments_on_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.date "date"
    t.string "treatment_location"
    t.integer "kind"
    t.bigint "medical_appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["medical_appointment_id"], name: "index_treatments_on_medical_appointment_id"
    t.index ["user_id"], name: "index_treatments_on_user_id"
  end

  create_table "user_shares", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "user_share_id", null: false
    t.datetime "end_date"
    t.integer "status", default: 1
    t.boolean "medical_appointment", default: false
    t.boolean "exam", default: false
    t.boolean "treatment", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_shares_on_user_id"
    t.index ["user_share_id"], name: "index_user_shares_on_user_share_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "exams", "medical_appointments"
  add_foreign_key "exams", "users"
  add_foreign_key "medical_appointments", "users"
  add_foreign_key "treatments", "medical_appointments"
  add_foreign_key "treatments", "users"
  add_foreign_key "user_shares", "users"
  add_foreign_key "user_shares", "users", column: "user_share_id"
end
