# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_05_143318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "assertion", null: false
    t.boolean "correct", default: false, null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "challenge_questions", force: :cascade do |t|
    t.bigint "challenge_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_challenge_questions_on_challenge_id"
    t.index ["question_id"], name: "index_challenge_questions_on_question_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.integer "question_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.integer "search_radius", default: 100
  end

  create_table "invitations", force: :cascade do |t|
    t.string "email", null: false
    t.boolean "accepted", default: false
    t.bigint "user_challenge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_challenge_id"], name: "index_invitations_on_user_challenge_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "place_id"
    t.boolean "open"
    t.integer "rating"
    t.integer "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_challenge_questions", force: :cascade do |t|
    t.bigint "user_challenge_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_user_challenge_questions_on_question_id"
    t.index ["user_challenge_id"], name: "index_user_challenge_questions_on_user_challenge_id"
  end

  create_table "user_challenges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id"
    t.integer "score", default: 0
    t.index ["challenge_id"], name: "index_user_challenges_on_challenge_id"
    t.index ["restaurant_id"], name: "index_user_challenges_on_restaurant_id"
    t.index ["user_id"], name: "index_user_challenges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "pseudo", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "challenge_questions", "challenges"
  add_foreign_key "challenge_questions", "questions"
  add_foreign_key "invitations", "user_challenges"
  add_foreign_key "user_challenge_questions", "questions"
  add_foreign_key "user_challenge_questions", "user_challenges"
  add_foreign_key "user_challenges", "challenges"
  add_foreign_key "user_challenges", "restaurants"
  add_foreign_key "user_challenges", "users"
end
