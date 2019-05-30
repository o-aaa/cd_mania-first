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

ActiveRecord::Schema.define(version: 2019_05_30_102640) do

  create_table "addresses", force: :cascade do |t|
    t.string "post_num"
    t.string "address"
    t.integer "shipping_address", default: 0
    t.integer "user_id"
    t.string "delivery_last_name"
    t.string "delivery_first_name"
    t.string "delivery_last_name_kana"
    t.string "delivery_first_name_kana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "deleted_at"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "buy_count"
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "disc_num", default: 0
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "buy_price"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.integer "bought_count"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "payment", default: 0
    t.integer "total_price"
    t.integer "delivery_status", default: 0
    t.integer "user_id"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "update_flag", default: 0
  end

  create_table "products", force: :cascade do |t|
    t.string "artist"
    t.integer "price"
    t.string "lebel"
    t.integer "genre", default: 0
    t.integer "buy_status", default: 0
    t.integer "stocks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label"
    t.text "image_id"
    t.integer "disc_type"
    t.string "product_name"
    t.string "release_date"
  end

  create_table "songs", force: :cascade do |t|
    t.string "song_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "disc_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "phone_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_flag", default: 0
    t.integer "user_status", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
