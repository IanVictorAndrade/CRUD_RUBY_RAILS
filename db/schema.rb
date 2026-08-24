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

ActiveRecord::Schema[8.1].define(version: 2026_08_24_154422) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.integer "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.integer "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "allowancetypes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "percentage"
    t.datetime "updated_at", null: false
  end

  create_table "backupempregados", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "state_id", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.datetime "updated_at", null: false
  end

  create_table "empregadoallowances", force: :cascade do |t|
    t.integer "allowancetype_id", null: false
    t.datetime "created_at", null: false
    t.integer "empregadosalario_id", null: false
    t.datetime "updated_at", null: false
    t.index ["allowancetype_id"], name: "index_empregadoallowances_on_allowancetype_id"
    t.index ["empregadosalario_id"], name: "index_empregadoallowances_on_empregadosalario_id"
  end

  create_table "empregados", force: :cascade do |t|
    t.date "birthdate"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.integer "department_id"
    t.string "email"
    t.string "firstname"
    t.string "gender"
    t.boolean "haspassport"
    t.date "hiredate"
    t.string "lastname"
    t.string "notes"
    t.string "phone"
    t.integer "salary"
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_empregados_on_country_id"
    t.index ["department_id"], name: "index_empregados_on_department_id"
  end

  create_table "empregadosalarios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "netallowanceamount"
    t.integer "netsalary"
    t.integer "salary"
    t.datetime "updated_at", null: false
  end

  create_table "offshoreempregados", force: :cascade do |t|
    t.integer "city_id", null: false
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.integer "state_id", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_offshoreempregados_on_city_id"
    t.index ["country_id"], name: "index_offshoreempregados_on_country_id"
    t.index ["state_id"], name: "index_offshoreempregados_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "gender"
    t.string "name"
    t.string "notes"
    t.string "password_digest"
    t.string "phone"
    t.integer "postalcode"
    t.string "role"
    t.boolean "termsandconditions"
    t.datetime "updated_at", null: false
    t.string "websiteurl"
  end

  add_foreign_key "cities", "states"
  add_foreign_key "empregadoallowances", "allowancetypes"
  add_foreign_key "empregadoallowances", "empregadosalarios"
  add_foreign_key "empregados", "countries"
  add_foreign_key "empregados", "departments"
  add_foreign_key "offshoreempregados", "cities"
  add_foreign_key "offshoreempregados", "countries"
  add_foreign_key "offshoreempregados", "states"
  add_foreign_key "states", "countries"
end
