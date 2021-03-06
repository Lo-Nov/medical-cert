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

ActiveRecord::Schema.define(version: 2021_10_05_111418) do

  create_table "certs", charset: "utf8mb4", force: :cascade do |t|
    t.string "full_name"
    t.string "id_number"
    t.string "company_name"
    t.string "business_id"
    t.string "sub_county"
    t.string "phone"
    t.string "ward"
    t.string "examined_at"
    t.string "lab_ref_number"
    t.string "expiry_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fires", charset: "utf8mb4", force: :cascade do |t|
    t.string "business_name"
    t.string "business_id"
    t.string "phone"
    t.string "email"
    t.string "plot_number"
    t.string "street"
    t.string "regitration_number"
    t.string "vehicle_type"
    t.string "inpection_date"
    t.string "certification_date"
    t.string "sub_county"
    t.string "ward"
    t.string "expiry_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hygienes", charset: "utf8mb4", force: :cascade do |t|
    t.string "full_name"
    t.string "business_id"
    t.string "plot_number"
    t.string "phone"
    t.string "email"
    t.string "lr_number"
    t.string "physical_address"
    t.string "nuture_of_business"
    t.string "amount"
    t.string "receipt_number"
    t.string "sub_county"
    t.string "ward"
    t.string "expiry_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "phone"
    t.string "usertype"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
