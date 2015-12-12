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

ActiveRecord::Schema.define(version: 20151212005908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "suggestions", force: :cascade do |t|
    t.integer  "topic_id",    null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.string   "created_by",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "suggestions", ["topic_id"], name: "index_suggestions_on_topic_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name",                  null: false
    t.text     "description",           null: false
    t.string   "slug",                  null: false
    t.datetime "suggestions_start_at",  null: false
    t.datetime "suggestions_end_at",    null: false
    t.string   "created_by",            null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "winning_suggestion_id"
  end

  add_index "topics", ["name"], name: "index_topics_on_name", using: :btree
  add_index "topics", ["slug"], name: "index_topics_on_slug", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "topic_id",                    null: false
    t.integer  "suggestion_ids", default: [], null: false, array: true
    t.string   "created_by",                  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "votes", ["topic_id", "created_by"], name: "index_votes_on_topic_id_and_created_by", unique: true, using: :btree

end
