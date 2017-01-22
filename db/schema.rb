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

ActiveRecord::Schema.define(version: 20170122223231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "degrees", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employments", force: :cascade do |t|
    t.integer  "submission_id"
    t.string   "employer"
    t.string   "title"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["submission_id"], name: "index_employments_on_submission_id", using: :btree
  end

  create_table "evalutions", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "commitment"
    t.integer  "scholarship"
    t.integer  "recommendations"
    t.integer  "goals"
    t.string   "remarks"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["submission_id"], name: "index_evalutions_on_submission_id", using: :btree
    t.index ["user_id"], name: "index_evalutions_on_user_id", using: :btree
  end

  create_table "fields", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "honors", force: :cascade do |t|
    t.integer  "submission_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["submission_id"], name: "index_honors_on_submission_id", using: :btree
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.integer  "submission_id"
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.string   "degree"
    t.float    "gpa"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["submission_id"], name: "index_institutions_on_submission_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "token"
    t.integer  "submission_id"
    t.string   "email"
    t.float    "years"
    t.string   "capacity"
    t.integer  "communication"
    t.integer  "motivation"
    t.integer  "habits"
    t.integer  "responsibility"
    t.integer  "personality"
    t.integer  "maturity"
    t.integer  "rating"
    t.string   "name"
    t.string   "title"
    t.string   "department"
    t.string   "institution"
    t.string   "address"
    t.string   "recommendation_file_name"
    t.string   "recommendation_content_type"
    t.integer  "recommendation_file_size"
    t.datetime "recommendation_updated_at"
    t.index ["submission_id"], name: "index_recommendations_on_submission_id", using: :btree
  end

  create_table "relatives", force: :cascade do |t|
    t.integer  "submission_id"
    t.string   "name"
    t.string   "relationship"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["submission_id"], name: "index_relatives_on_submission_id", using: :btree
  end

  create_table "submissions", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "permanent_address"
    t.string   "permanent_city"
    t.string   "permanent_state"
    t.integer  "permanent_zip"
    t.string   "permanent_phone"
    t.string   "current_address"
    t.string   "current_city"
    t.string   "current_state"
    t.integer  "current_zip"
    t.string   "current_phone"
    t.boolean  "citizen"
    t.integer  "field_id"
    t.text     "field_explanation"
    t.integer  "degree_id"
    t.text     "degree_explanation"
    t.string   "institution_name"
    t.string   "institution_city"
    t.string   "institution_state"
    t.boolean  "acceptance"
    t.boolean  "last_year"
    t.text     "last_year_explanation"
    t.integer  "summer_tuition"
    t.integer  "summer_books"
    t.integer  "summer_board"
    t.integer  "summer_other"
    t.integer  "summer_hours"
    t.integer  "fall_tuition"
    t.integer  "fall_books"
    t.integer  "fall_board"
    t.integer  "fall_other"
    t.integer  "fall_hours"
    t.integer  "winter_tuition"
    t.integer  "winter_books"
    t.integer  "winter_board"
    t.integer  "winter_other"
    t.integer  "winter_hours"
    t.integer  "spring_tuition"
    t.integer  "spring_books"
    t.integer  "spring_board"
    t.integer  "spring_other"
    t.integer  "spring_hours"
    t.string   "frequency"
    t.text     "motivation"
    t.integer  "user_id"
    t.datetime "start_date"
    t.string   "license_file_name"
    t.string   "license_content_type"
    t.integer  "license_file_size"
    t.datetime "license_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "expense_file_name"
    t.string   "expense_content_type"
    t.integer  "expense_file_size"
    t.datetime "expense_updated_at"
    t.boolean  "approval"
    t.boolean  "reapply"
    t.index ["degree_id"], name: "index_submissions_on_degree_id", using: :btree
    t.index ["field_id"], name: "index_submissions_on_field_id", using: :btree
    t.index ["user_id"], name: "index_submissions_on_user_id", using: :btree
  end

  create_table "transcripts", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "institution_id"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.string   "email"
    t.string   "token"
    t.index ["institution_id"], name: "index_transcripts_on_institution_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "submission_id"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["submission_id"], name: "index_users_on_submission_id", using: :btree
  end

  create_table "volunteers", force: :cascade do |t|
    t.integer  "submission_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["submission_id"], name: "index_volunteers_on_submission_id", using: :btree
  end

  add_foreign_key "employments", "submissions"
  add_foreign_key "evalutions", "submissions"
  add_foreign_key "evalutions", "users"
  add_foreign_key "honors", "submissions"
  add_foreign_key "institutions", "submissions"
  add_foreign_key "recommendations", "submissions"
  add_foreign_key "relatives", "submissions"
  add_foreign_key "submissions", "degrees"
  add_foreign_key "submissions", "fields"
  add_foreign_key "submissions", "users"
  add_foreign_key "transcripts", "institutions"
  add_foreign_key "users", "submissions"
  add_foreign_key "volunteers", "submissions"
end
