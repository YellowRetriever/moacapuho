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

ActiveRecord::Schema.define(version: 2021_11_04_044105) do

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.string "prefecture"
    t.string "city"
    t.string "address"
    t.text "text"
    t.integer "provider_id"
    t.integer "show_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.string "prefecture"
    t.string "city"
    t.string "address"
    t.string "phone"
    t.string "hp_url"
    t.string "twitter_account"
    t.string "insta_account"
    t.string "facebook_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
