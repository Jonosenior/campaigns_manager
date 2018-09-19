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

ActiveRecord::Schema.define(version: 20180919224924) do

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.string "tags"
    t.string "estimated_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expert_id"
    t.index ["expert_id"], name: "index_campaigns_on_expert_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_todo_lists_on_campaign_id"
    t.index ["user_id"], name: "index_todo_lists_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.boolean "complete"
    t.integer "todo_list_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_list_id"], name: "index_todos_on_todo_list_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "profession"
    t.string "service"
    t.string "type"
    t.integer "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
