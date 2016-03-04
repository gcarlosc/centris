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

ActiveRecord::Schema.define(version: 20160304172934) do

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

# Could not dump table "movements" because of following StandardError
#   Unknown type 'status' for column 'status'

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
    t.integer  "classification_id"
    t.integer  "description_id"
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

  create_table "skus", force: :cascade do |t|
    t.string   "sku"
    t.string   "status"
    t.integer  "product_id"
    t.integer  "warehouse_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "movement_id"
  end

  add_index "skus", ["movement_id"], name: "index_skus_on_movement_id", using: :btree
  add_index "skus", ["product_id"], name: "index_skus_on_product_id", using: :btree
  add_index "skus", ["sku"], name: "index_skus_on_sku", unique: true, using: :btree
  add_index "skus", ["warehouse_id"], name: "index_skus_on_warehouse_id", using: :btree

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
    t.string   "email"
    t.integer  "phone"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest", null: false
    t.string   "fullname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "address"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "skus", "movements"
  add_foreign_key "skus", "products"
  add_foreign_key "skus", "warehouses"
end
