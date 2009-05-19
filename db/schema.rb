# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090518133732) do

  create_table "groups", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "caption"
    t.string   "group_type",                    :null => false
    t.integer  "owner_id",                      :null => false
    t.integer  "creator_id",                    :null => false
    t.boolean  "active",     :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "introductions", :force => true do |t|
    t.string   "email",       :null => false
    t.integer  "sender_id",   :null => false
    t.integer  "group_id",    :null => false
    t.integer  "receiver_id"
    t.string   "status",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", :force => true do |t|
    t.string   "email",       :null => false
    t.integer  "group_id",    :null => false
    t.integer  "receiver_id"
    t.string   "status",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "join_requests", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "group_id",   :null => false
    t.string   "status",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "group_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "body",       :null => false
    t.integer  "user_id",    :null => false
    t.integer  "group_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",           :null => false
    t.string   "encrypted_password", :null => false
    t.string   "email",              :null => false
    t.string   "name",               :null => false
    t.datetime "dob"
    t.string   "gender"
    t.string   "status",             :null => false
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
