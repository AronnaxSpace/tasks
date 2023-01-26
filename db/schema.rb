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

ActiveRecord::Schema[7.0].define(version: 2023_01_26_222035) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "task_sets", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "assignee_id"
    t.index ["assignee_id"], name: "index_task_sets_on_assignee_id"
    t.index ["user_id"], name: "index_task_sets_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "task_set_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "assignee_id"
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id"
    t.index ["task_set_id"], name: "index_tasks_on_task_set_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "aronnax_access_token"
    t.string "aronnax_refresh_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "task_sets", "users"
  add_foreign_key "task_sets", "users", column: "assignee_id"
  add_foreign_key "tasks", "task_sets"
  add_foreign_key "tasks", "users"
  add_foreign_key "tasks", "users", column: "assignee_id"
end
