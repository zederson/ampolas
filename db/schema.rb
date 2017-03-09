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

ActiveRecord::Schema.define(version: 20170309005649) do

  create_table "beers", force: :cascade do |t|
    t.integer "brewery_id"
    t.integer "category_id"
    t.integer "style_id"
    t.string  "name"
    t.float   "abv"
    t.float   "ibu"
    t.float   "srm"
    t.float   "upc"
    t.string  "description"
    t.index ["brewery_id"], name: "index_beers_on_brewery_id"
    t.index ["category_id"], name: "index_beers_on_category_id"
    t.index ["style_id"], name: "index_beers_on_style_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "complement"
    t.string   "city"
    t.string   "state"
    t.string   "code"
    t.string   "country"
    t.string   "phone"
    t.string   "site"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["code"], name: "index_breweries_on_code"
  end

  create_table "brewery_geocodes", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "accuracy"
    t.integer  "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brewery_id"], name: "index_brewery_geocodes_on_brewery_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "styles", force: :cascade do |t|
    t.string  "name"
    t.integer "category_id"
    t.index ["category_id"], name: "index_styles_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
