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

ActiveRecord::Schema.define(version: 2020_07_29_113326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datespots", force: :cascade do |t|
    t.string "name"
    t.string "area"
    t.string "price"
    t.text "keyword"
    t.text "point"
    t.text "caution"
    t.string "picture"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_datespots_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_datespots_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "area"
    t.string "price"
    t.text "keyword"
    t.text "point"
    t.text "caution"
    t.string "picture"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "introduction"
    t.integer "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "picture"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "datespots", "users"
  add_foreign_key "posts", "users"
end
