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

ActiveRecord::Schema.define(version: 20160406110720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tracks", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.string   "name",         limit: 40, null: false
    t.string   "artist",       limit: 50
    t.integer  "access_level"
    t.string   "location",                null: false
    t.string   "genre"
    t.integer  "views"
    t.float    "rating"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "tracks", ["access_level"], name: "index_tracks_on_access_level", using: :btree
  add_index "tracks", ["artist"], name: "index_tracks_on_artist", using: :btree
  add_index "tracks", ["genre"], name: "index_tracks_on_genre", using: :btree
  add_index "tracks", ["name"], name: "index_tracks_on_name", using: :btree
  add_index "tracks", ["user_id"], name: "index_tracks_on_user_id", using: :btree
  add_index "tracks", ["views"], name: "index_tracks_on_views", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 40
    t.string   "last_name",       limit: 40
    t.string   "email",           limit: 100, null: false
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
