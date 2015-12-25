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

ActiveRecord::Schema.define(version: 20151225202233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lecturers", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "surname"
    t.string   "fname"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "works"
    t.text     "recomendations"
    t.text     "projects"
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "semester",    default: 1, null: false
    t.integer  "points",      default: 0, null: false
    t.string   "professor"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "subjects_id"
  end

  add_index "marks", ["subjects_id"], name: "index_marks_on_subjects_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",               default: "",  null: false
    t.string   "surname",            default: "",  null: false
    t.string   "fname",              default: "",  null: false
    t.string   "emails",             default: "",  null: false
    t.string   "phone_number",       default: "0", null: false
    t.string   "group",              default: "",  null: false
    t.integer  "course",             default: 1,   null: false
    t.string   "date_of_birth"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "achievments"
    t.text     "projects"
    t.text     "about"
    t.string   "adress"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "credit"
    t.integer  "number_of_hours"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "lecturers_id"
  end

  add_index "subjects", ["lecturers_id"], name: "index_subjects_on_lecturers_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "permissions",            default: "observe"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
