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

ActiveRecord::Schema.define(:version => 20120823104007) do

  create_table "comments", :force => true do |t|
    t.string   "body"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "groups", :force => true do |t|
    t.string   "goal"
    t.string   "subject"
    t.string   "place"
    t.integer  "people"
    t.string   "name"
    t.string   "rule"
    t.text     "introduce"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "parties", :force => true do |t|
    t.string   "body"
    t.date     "date"
    t.time     "starttime"
    t.time     "endtime"
    t.string   "place"
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["group_id"], :name => "index_posts_on_group_id"

end
