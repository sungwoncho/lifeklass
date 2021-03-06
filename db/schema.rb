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

ActiveRecord::Schema.define(version: 20150509023738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_categories", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "course_categories", ["category_id"], name: "index_course_categories_on_category_id", using: :btree
  add_index "course_categories", ["course_id"], name: "index_course_categories_on_course_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "courses", ["owner_type", "owner_id"], name: "index_courses_on_owner_type_and_owner_id", using: :btree

  create_table "courses_comments", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "content_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.string   "state"
  end

  add_index "courses_comments", ["ancestry"], name: "index_courses_comments_on_ancestry", using: :btree
  add_index "courses_comments", ["content_id"], name: "index_courses_comments_on_content_id", using: :btree
  add_index "courses_comments", ["owner_type", "owner_id"], name: "index_courses_comments_on_owner_type_and_owner_id", using: :btree

  create_table "courses_contents", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "menu_id"
  end

  add_index "courses_contents", ["course_id"], name: "index_courses_contents_on_course_id", using: :btree
  add_index "courses_contents", ["menu_id"], name: "index_courses_contents_on_menu_id", using: :btree

  create_table "courses_menus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "course_id"
    t.integer  "position",   default: 0
  end

  add_index "courses_menus", ["course_id"], name: "index_courses_menus_on_course_id", using: :btree

  create_table "enrollments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "mentors", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
  end

  add_index "mentors", ["organization_id"], name: "index_mentors_on_organization_id", using: :btree
  add_index "mentors", ["user_id"], name: "index_mentors_on_user_id", using: :btree

  create_table "mentors_mentor_organizations", force: :cascade do |t|
    t.integer  "mentor_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "mentors_mentor_organizations", ["mentor_id"], name: "index_mentors_mentor_organizations_on_mentor_id", using: :btree
  add_index "mentors_mentor_organizations", ["organization_id"], name: "index_mentors_mentor_organizations_on_organization_id", using: :btree

  create_table "mentors_mentorships", force: :cascade do |t|
    t.integer  "mentor_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mentors_mentorships", ["course_id"], name: "index_mentors_mentorships_on_course_id", using: :btree
  add_index "mentors_mentorships", ["mentor_id"], name: "index_mentors_mentorships_on_mentor_id", using: :btree

  create_table "mentors_organizations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "mentor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "mentors_organizations", ["mentor_id"], name: "index_mentors_organizations_on_mentor_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "mentors_mentorships", "courses"
  add_foreign_key "mentors_mentorships", "mentors"
end
