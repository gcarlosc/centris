# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160224175808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "category_products", force: :cascade do |t|
    t.string   "name"
    t.integer  "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "descriptions", force: :cascade do |t|
    t.string   "brand"
    t.string   "sub_brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movement_types", force: :cascade do |t|
    t.string   "name"
    t.string   "factor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movements", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "responsable_id"
    t.string   "status"
    t.integer  "movement_type_id"
    t.integer  "originable_id"
    t.string   "originable_type"
    t.integer  "destinable_id"
    t.string   "destinable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "movements", ["destinable_type", "destinable_id"], name: "index_movements_on_destinable_type_and_destinable_id", using: :btree
  add_index "movements", ["originable_type", "originable_id"], name: "index_movements_on_originable_type_and_originable_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "logo"
    t.string   "web"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_product_id"
    t.integer  "description_id"
    t.integer  "classification_id"
    t.integer  "unit_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "phone"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "address"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
