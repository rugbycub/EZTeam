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

ActiveRecord::Schema.define(version: 20140324173628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "stateprovence_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree
  add_index "cities", ["stateprovence_id"], name: "index_cities_on_stateprovence_id", using: :btree

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "state"
    t.integer  "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clubs", ["timezone"], name: "idx_clubs_0", using: :btree

  create_table "conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "countries", id: false, force: true do |t|
    t.string   "country_code", limit: 2, null: false
    t.string   "country_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_responses", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "attending"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_responses", ["event_id"], name: "index_event_responses_on_event_id", using: :btree
  add_index "event_responses", ["user_id"], name: "index_event_responses_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.integer  "group_id"
    t.string   "group_type"
    t.string   "type"
    t.string   "opponent"
    t.date     "event_date"
    t.time     "starting_time"
    t.time     "ending_time"
    t.boolean  "recurring"
    t.integer  "frequency"
    t.string   "timeframe"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["group_id", "group_type"], name: "index_events_on_group_id_and_group_type", using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "league", id: false, force: true do |t|
    t.integer "id",               null: false
    t.string  "name", limit: 100
  end

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], name: "index_notifications_on_conversation_id", using: :btree

  create_table "positions", force: true do |t|
    t.string   "name"
    t.integer  "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["sport_id"], name: "index_positions_on_sport_id", using: :btree

  create_table "receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "receipts", ["notification_id"], name: "index_receipts_on_notification_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sports", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stateprovences", id: false, force: true do |t|
    t.string   "code",       limit: 3, null: false
    t.string   "name"
    t.string   "country_id", limit: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stateprovences", ["country_id"], name: "index_stateprovences_on_country_id", using: :btree

  create_table "teams", force: true do |t|
    t.integer  "club_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sport"
    t.integer  "league"
  end

  add_index "teams", ["club_id"], name: "index_teams_on_club_id", unique: true, using: :btree
  add_index "teams", ["league"], name: "idx_teams_0", using: :btree
  add_index "teams", ["sport"], name: "idx_teams", using: :btree

  create_table "timezones", primary_key: "gmt_offset", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_phone"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.date     "date_of_birth"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.integer "team_id"
  end

  add_index "users_roles", ["role_id"], name: "idx_users_roles_0", using: :btree
  add_index "users_roles", ["team_id"], name: "index_users_roles_on_team_id", using: :btree
  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  add_index "users_roles", ["user_id"], name: "idx_users_roles", using: :btree

  add_foreign_key "clubs", "timezones", name: "fk_clubs_timezones", column: "timezone", primary_key: "gmt_offset"

  add_foreign_key "notifications", "conversations", name: "notifications_on_conversation_id"

  add_foreign_key "positions", "sports", name: "fk_positions_sports"

  add_foreign_key "receipts", "notifications", name: "receipts_on_notification_id"

  add_foreign_key "sports", "teams", name: "fk_sports", column: "id", primary_key: "club_id"

  add_foreign_key "stateprovences", "countries", name: "fk_stateprovences_countries", primary_key: "country_code"

  add_foreign_key "teams", "clubs", name: "fk_teams_clubs"
  add_foreign_key "teams", "league", name: "fk_teams_league", column: "league"
  add_foreign_key "teams", "sports", name: "fk_teams_sports", column: "sport"

  add_foreign_key "users_roles", "roles", name: "fk_users_roles_roles"
  add_foreign_key "users_roles", "teams", name: "fk_users_roles_teams"
  add_foreign_key "users_roles", "users", name: "fk_users_roles_users"

end
