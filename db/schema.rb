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

ActiveRecord::Schema.define(version: 20140102104329) do

  create_table "albuminfos", force: true do |t|
    t.string   "albumsongtitle"
    t.string   "albumsongpath"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  create_table "contacts", force: true do |t|
    t.string   "contactusername"
    t.string   "contactemail"
    t.string   "contactquery"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customerorders", force: true do |t|
    t.date     "orderdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "customers", force: true do |t|
    t.string   "customerusername"
    t.string   "customerpassword"
    t.string   "customername"
    t.string   "customersurname"
    t.string   "customeraddressstreet"
    t.string   "customeraddressstreetnum"
    t.string   "customeraddresscity"
    t.integer  "customerpostnumber"
    t.string   "customeremail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end

  create_table "data_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderitems", force: true do |t|
    t.integer  "orderquantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
    t.integer  "customerorders_id"
  end

  create_table "products", force: true do |t|
    t.string   "productartist"
    t.string   "productalbum"
    t.integer  "productprice"
    t.string   "productpathpicture"
    t.string   "producttype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
