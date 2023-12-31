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

ActiveRecord::Schema.define(version: 20151222171138) do

  create_table "response_dates", force: :cascade do |t|
    t.datetime "date"
    t.integer  "share_count",    limit: 4,   default: 0
    t.integer  "response_count", limit: 4,   default: 0
    t.integer  "dateable_id",    limit: 4
    t.string   "dateable_type",  limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "response_dates", ["dateable_type", "dateable_id"], name: "index_response_dates_on_dateable_type_and_dateable_id", using: :btree

  create_table "static_tools", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "page_key",       limit: 30
    t.integer  "response_count", limit: 4,  default: 0
    t.integer  "share_count",    limit: 4,  default: 0
  end

  add_index "static_tools", ["page_key"], name: "index_static_tools_on_page_key", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "first_name",             limit: 30
    t.string   "last_name",              limit: 30
    t.boolean  "active",                 limit: 1,   default: true
    t.boolean  "locked",                 limit: 1,   default: false
    t.string   "role",                   limit: 30
    t.integer  "creator_id",             limit: 4
  end

  add_index "users", ["active"], name: "index_users_on_active", using: :btree
  add_index "users", ["creator_id"], name: "index_users_on_creator_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["locked"], name: "index_users_on_locked", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

end
