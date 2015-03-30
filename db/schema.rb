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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150329125119) do

  create_table "categories", :force => true do |t|
    t.integer  "video_class_id",                    :null => false
    t.string   "cat_name",                          :null => false
    t.string   "session_id",                        :null => false
    t.string   "session_url"
    t.boolean  "active",         :default => false, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "categories", ["cat_name"], :name => "unique_cat_name", :unique => true
  add_index "categories", ["session_id"], :name => "unique_session_id", :unique => true
  add_index "categories", ["session_url"], :name => "unique_session_url", :unique => true
  add_index "categories", ["video_class_id"], :name => "categories_video_class_id_fk"

  create_table "login_details", :force => true do |t|
    t.integer  "user_id",                          :null => false
    t.string   "user_login_id",                    :null => false
    t.string   "password",                         :null => false
    t.boolean  "is_logged_in",  :default => false, :null => false
    t.integer  "role_id",                          :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "login_details", ["role_id"], :name => "login_details_role_id_fk"
  add_index "login_details", ["user_id"], :name => "login_details_user_id_fk"

  create_table "roles", :force => true do |t|
    t.string   "role",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["role"], :name => "unique_role", :unique => true

  create_table "user_category_mappings", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_category_mappings", ["category_id"], :name => "category_id_fk"
  add_index "user_category_mappings", ["user_id"], :name => "user_id_fk"

  create_table "user_notifications", :force => true do |t|
    t.integer  "from_user_id",                    :null => false
    t.integer  "to_user_id",                      :null => false
    t.text     "message",                         :null => false
    t.boolean  "read_status",  :default => false, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "user_notifications", ["from_user_id"], :name => "user_notifications_from_user_id_fk"
  add_index "user_notifications", ["to_user_id"], :name => "user_notifications_to_user_id_fk"

  create_table "users", :force => true do |t|
    t.string   "name",           :limit => 150,                         :null => false
    t.string   "email",          :limit => 100,                         :null => false
    t.string   "phone",          :limit => 25,                          :null => false
    t.date     "date_of_birth"
    t.string   "sex",            :limit => 10
    t.text     "address"
    t.string   "city",           :limit => 50
    t.string   "country",        :limit => 50
    t.string   "specialization"
    t.integer  "role_id"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "user_status",                   :default => "Approved", :null => false
    t.string   "user_alias",                                            :null => false
  end

  add_index "users", ["role_id"], :name => "users_role_id_fk"

  create_table "video_classes", :force => true do |t|
    t.string   "class_name", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_foreign_key "categories", "video_classes", name: "categories_video_class_id_fk"

  add_foreign_key "login_details", "roles", name: "login_details_role_id_fk"
  add_foreign_key "login_details", "users", name: "login_details_user_id_fk"

  add_foreign_key "user_category_mappings", "categories", name: "category_id_fk"
  add_foreign_key "user_category_mappings", "users", name: "user_id_fk"

  add_foreign_key "user_notifications", "users", name: "user_notifications_from_user_id_fk", column: "from_user_id"
  add_foreign_key "user_notifications", "users", name: "user_notifications_to_user_id_fk", column: "to_user_id"

  add_foreign_key "users", "roles", name: "users_role_id_fk"

end
