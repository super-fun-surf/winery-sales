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

ActiveRecord::Schema.define(version: 20160517041250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.integer  "population"
    t.string   "profile_image_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "county_id"
    t.string   "profile_image_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["county_id"], name: "index_regions_on_county_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "permissions",       default: 0
    t.string   "activation_digest"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "title"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "wineries", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.integer  "year_established"
    t.integer  "num_of_employees"
    t.string   "profile_image_id"
    t.boolean  "estate"
    t.jsonb    "reminder_days"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["region_id"], name: "index_wineries_on_region_id", using: :btree
    t.index ["reminder_days"], name: "index_wineries_on_reminder_days", using: :gin
  end

  add_foreign_key "regions", "counties"
  add_foreign_key "wineries", "regions"
end
