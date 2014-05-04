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

ActiveRecord::Schema.define(version: 20140504195437) do

  create_table "menu_items", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "menu_id"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_trucks", force: true do |t|
    t.string   "truck_id"
    t.datetime "openUntil",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  create_table "trucks", force: true do |t|
    t.float    "lng"
    t.float    "lat"
    t.string   "name"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trucks_users", id: false, force: true do |t|
    t.integer "truck_id"
    t.integer "user_id"
  end

  add_index "trucks_users", ["truck_id"], name: "index_trucks_users_on_truck_id"
  add_index "trucks_users", ["user_id"], name: "index_trucks_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
