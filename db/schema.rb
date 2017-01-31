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

ActiveRecord::Schema.define(version: 20170131190916) do

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

end
