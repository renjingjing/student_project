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

ActiveRecord::Schema.define(version: 20150629154956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_resources", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "kind_id"
    t.string   "resource_file"
    t.integer  "course_unit_id"
    t.boolean  "hidden"
  end

  add_index "course_resources", ["course_unit_id"], name: "index_course_resources_on_course_unit_id", using: :btree
  add_index "course_resources", ["kind_id"], name: "index_course_resources_on_kind_id", using: :btree

  create_table "course_units", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id"
  end

  add_index "course_units", ["course_id"], name: "index_course_units_on_course_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "course_logo"
    t.text     "description"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "token"
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.boolean  "student"
    t.string   "email"
    t.boolean  "active"
  end

  add_index "invitations", ["course_id"], name: "index_invitations_on_course_id", using: :btree
  add_index "invitations", ["inviter_id"], name: "index_invitations_on_inviter_id", using: :btree
  add_index "invitations", ["token"], name: "index_invitations_on_token", using: :btree

  create_table "kinds", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "password_requests", force: :cascade do |t|
    t.string   "email"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.boolean  "active"
  end

  add_index "password_requests", ["user_id"], name: "index_password_requests_on_user_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.boolean  "complete"
    t.integer  "user_id"
    t.integer  "course_resource_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "scores", ["course_resource_id"], name: "index_scores_on_course_resource_id", using: :btree
  add_index "scores", ["user_id"], name: "index_scores_on_user_id", using: :btree

  create_table "studyings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "studyings", ["course_id"], name: "index_studyings_on_course_id", using: :btree
  add_index "studyings", ["user_id"], name: "index_studyings_on_user_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_resource_id"
    t.text     "body"
    t.string   "file"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "submissions", ["course_resource_id"], name: "index_submissions_on_course_resource_id", using: :btree
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_table "syllabuses", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "course_unit_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "syllabuses", ["course_id"], name: "index_syllabuses_on_course_id", using: :btree
  add_index "syllabuses", ["course_unit_id"], name: "index_syllabuses_on_course_unit_id", using: :btree

  create_table "teachings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teachings", ["course_id"], name: "index_teachings_on_course_id", using: :btree
  add_index "teachings", ["user_id"], name: "index_teachings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.boolean  "teacher"
    t.string   "avatar"
    t.string   "city"
    t.string   "country"
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "course_resources", "course_units"
  add_foreign_key "course_resources", "kinds"
  add_foreign_key "course_units", "courses"
  add_foreign_key "invitations", "courses"
  add_foreign_key "password_requests", "users"
  add_foreign_key "scores", "course_resources"
  add_foreign_key "scores", "users"
  add_foreign_key "studyings", "courses"
  add_foreign_key "studyings", "users"
  add_foreign_key "submissions", "course_resources"
  add_foreign_key "submissions", "users"
  add_foreign_key "syllabuses", "course_units"
  add_foreign_key "syllabuses", "courses"
  add_foreign_key "teachings", "courses"
  add_foreign_key "teachings", "users"
end
