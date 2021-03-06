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

ActiveRecord::Schema.define(version: 20170709020339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer "matcher_user_id"
    t.integer "matched_user_id"
    t.datetime "time_matched"
    t.index ["matcher_user_id"], name: "matcher_nonunique_idx"
  end

  create_table "swipes", force: :cascade do |t|
    t.integer "swiper_user_id"
    t.integer "swipee_user_id"
    t.datetime "time_swiped"
    t.integer "direction"
    t.index ["swiper_user_id", "swipee_user_id"], name: "swiper_swipee_unique_idx", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.integer "age"
    t.text "bio"
  end

  add_foreign_key "swipes", "users", column: "swipee_user_id"
  add_foreign_key "swipes", "users", column: "swiper_user_id"
end
