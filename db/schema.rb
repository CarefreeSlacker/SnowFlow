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

ActiveRecord::Schema.define(version: 20140221161516) do

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.float    "total_price"
    t.integer  "total_positions"
    t.integer  "total_items"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.boolean  "checkouted"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "headdresses", force: true do |t|
    t.string   "manufacturer"
    t.integer  "warmnes"
    t.float    "price"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "matherial"
    t.string   "collection"
    t.string   "name"
  end

  create_table "items", force: true do |t|
    t.integer  "good_id"
    t.string   "good_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"
  add_index "items", ["good_id", "good_type"], name: "index_items_on_good_id_and_good_type", unique: true

  create_table "orders", force: true do |t|
    t.integer  "cart_id"
    t.integer  "user_id"
    t.string   "country"
    t.string   "region"
    t.string   "post_code"
    t.string   "lane"
    t.string   "home"
    t.string   "appartament"
    t.integer  "floor"
    t.boolean  "personal_payment"
    t.boolean  "shipped"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.boolean  "done"
  end

  create_table "positions", force: true do |t|
    t.integer  "cart_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.float    "total_price"
    t.boolean  "changed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["cart_id"], name: "index_positions_on_cart_id"

  create_table "snowboards", force: true do |t|
    t.string   "manufacturer"
    t.string   "name"
    t.integer  "length"
    t.string   "righty"
    t.integer  "deflection"
    t.string   "form"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
    t.integer  "category_id"
  end

  add_index "snowboards", ["category_id"], name: "index_snowboards_on_category_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "role",            default: "customer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
