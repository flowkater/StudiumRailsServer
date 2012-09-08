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

ActiveRecord::Schema.define(:version => 20120901074305) do

  create_table "comments", :force => true do |t|
    t.string   "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "goal"
    t.string   "subject"
    t.string   "place"
    t.integer  "people"
    t.string   "name"
    t.boolean  "recruit",    :default => true
    t.text     "introduce"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "memberships", ["group_id"], :name => "index_memberships_on_group_id"
  add_index "memberships", ["user_id", "group_id"], :name => "index_memberships_on_user_id_and_group_id", :unique => true
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "parties", :force => true do |t|
    t.string   "body"
    t.date     "date"
    t.string   "time"
    t.string   "place"
    t.string   "attendrate"
    t.string   "todorate"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "parties", ["group_id"], :name => "index_parties_on_group_id"

  create_table "partymessages", :force => true do |t|
    t.string   "body"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "partymessages", ["group_id"], :name => "index_partymessages_on_group_id"

  create_table "pictures", :force => true do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "pictures", ["imageable_id", "imageable_type"], :name => "index_pictures_on_imageable_id_and_imageable_type"

  create_table "posts", :force => true do |t|
    t.text     "body"
    t.integer  "posttype"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["group_id"], :name => "index_posts_on_group_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "todolists", :force => true do |t|
    t.string   "list"
    t.integer  "party_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name"
    t.string   "gender"
    t.string   "avatar"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
