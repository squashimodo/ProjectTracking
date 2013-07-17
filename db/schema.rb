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

ActiveRecord::Schema.define(:version => 20120122185035) do

  create_table "projects", :force => true do |t|
    t.string   "name",                        :null => false
    t.string   "description", :default => "", :null => false
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_id"
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "projects_users", ["user_id", "project_id"], :name => "index_projects_users_on_user_id_and_project_id"

  create_table "roles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string "name", :limit => 25, :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string   "name",        :limit => 30,                    :null => false
    t.string   "description",               :default => "",    :null => false
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "project_id"
    t.integer  "status_id"
    t.integer  "user_id",                                      :null => false
    t.boolean  "done",                      :default => false
  end

  add_index "tickets", ["project_id"], :name => "index_tickets_on_project_id"
  add_index "tickets", ["status_id"], :name => "index_tickets_on_status_id"

  create_table "users", :force => true do |t|
    t.string   "username",   :limit => 25,                :null => false
    t.string   "password",                                :null => false
    t.string   "first_name", :limit => 25,                :null => false
    t.string   "last_name",  :limit => 25,                :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "role_id",                  :default => 0
    t.text     "salt"
    t.string   "email",                                   :null => false
  end

end
