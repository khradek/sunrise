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

ActiveRecord::Schema.define(version: 20180708175622) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_conversations_on_patient_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "follow_ups", force: :cascade do |t|
    t.string   "expect_response"
    t.integer  "yes_message_ref"
    t.integer  "no_message_ref"
    t.integer  "one_message_ref"
    t.integer  "two_message_ref"
    t.integer  "three_message_ref"
    t.integer  "four_message_ref"
    t.integer  "five_message_ref"
    t.integer  "recurring_message_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "body"
    t.integer  "reference_number"
    t.index ["recurring_message_id"], name: "index_follow_ups_on_recurring_message_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "to"
    t.string   "from"
    t.string   "status"
    t.string   "body"
    t.string   "message_sid"
    t.string   "account_sid"
    t.string   "messaging_service_sid"
    t.string   "direction"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.datetime "send_at"
    t.datetime "sent_at"
    t.boolean  "recurring",             default: false, null: false
    t.string   "frequency"
    t.integer  "recurring_message_id"
    t.string   "expect_response"
    t.integer  "reference_number"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["recurring_message_id"], name: "index_messages_on_recurring_message_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "recurring_messages", force: :cascade do |t|
    t.datetime "end_date"
    t.datetime "start_date"
    t.string   "frequency"
    t.string   "body"
    t.string   "to"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "expect_response"
    t.index ["conversation_id"], name: "index_recurring_messages_on_conversation_id"
    t.index ["user_id"], name: "index_recurring_messages_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
