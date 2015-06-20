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

ActiveRecord::Schema.define(version: 20150620182737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_activities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.string   "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "type"
    t.string   "category"
    t.integer  "check_number"
    t.string   "check_to"
    t.string   "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "in_progresses", force: :cascade do |t|
    t.integer "log_id"
    t.integer "open_item_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string   "pdf"
    t.string   "date"
    t.string   "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "expense_id"
  end

  create_table "open_items", force: :cascade do |t|
    t.string   "task"
    t.string   "date"
    t.integer  "user_id"
    t.string   "notes"
    t.boolean  "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "royce_connector", force: :cascade do |t|
    t.integer  "roleable_id",   null: false
    t.string   "roleable_type", null: false
    t.integer  "role_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_connector", ["role_id"], name: "index_royce_connector_on_role_id", using: :btree
  add_index "royce_connector", ["roleable_id", "roleable_type"], name: "index_royce_connector_on_roleable_id_and_roleable_type", using: :btree

  create_table "royce_role", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_role", ["name"], name: "index_royce_role_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "name"
    t.string   "role"
    t.string   "job_title"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
