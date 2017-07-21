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

ActiveRecord::Schema.define(version: 20170721061445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session"
    t.index ["session"], name: "index_users_on_session"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "ws_servers", force: :cascade do |t|
    t.string "name"
    t.string "family"
    t.integer "connections", default: 0
    t.boolean "online", default: false
    t.index ["family"], name: "index_ws_servers_on_family"
    t.index ["name"], name: "index_ws_servers_on_name", unique: true
    t.index ["online"], name: "index_ws_servers_on_online"
  end

  create_table "ws_sessions", id: false, force: :cascade do |t|
    t.string "id"
    t.uuid "user_id"
    t.bigint "ws_server_id"
    t.string "channel"
    t.boolean "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel"], name: "index_ws_sessions_on_channel"
    t.index ["user_id"], name: "index_ws_sessions_on_user_id"
    t.index ["ws_server_id"], name: "index_ws_sessions_on_ws_server_id"
  end

  add_foreign_key "ws_sessions", "ws_servers"
end
