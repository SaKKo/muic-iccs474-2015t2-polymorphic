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

ActiveRecord::Schema.define(version: 20160307075045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.text     "tax_number"
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["tax_number"], name: "index_companies_on_tax_number", using: :btree

  create_table "financers", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "individuals", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_customers", force: :cascade do |t|
    t.text     "number"
    t.integer  "tradeable_id"
    t.text     "tradeable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "my_customers", ["number"], name: "index_my_customers_on_number", using: :btree
  add_index "my_customers", ["tradeable_id"], name: "index_my_customers_on_tradeable_id", using: :btree
  add_index "my_customers", ["tradeable_type"], name: "index_my_customers_on_tradeable_type", using: :btree

end
