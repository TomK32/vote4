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

ActiveRecord::Schema.define(:version => 20090514221351) do

  create_table "users", :force => true do |t|
    t.string   "twitter_id"
    t.string   "login"
    t.string   "access_token"
    t.string   "access_secret"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.string   "profile_image_url"
    t.string   "url"
    t.boolean  "protected"
    t.string   "profile_background_color"
    t.string   "profile_sidebar_fill_color"
    t.string   "profile_link_color"
    t.string   "profile_sidebar_border_color"
    t.string   "profile_text_color"
    t.string   "profile_background_image_url"
    t.boolean  "profile_background_tiled"
    t.integer  "friends_count"
    t.integer  "statuses_count"
    t.integer  "followers_count"
    t.integer  "favourites_count"
    t.integer  "utc_offset"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "voting_id",  :null => false
    t.string   "option",     :null => false
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voting_id", "option"], :name => "index_votes_on_voting_id_and_option"
  add_index "votes", ["voting_id", "user_id"], :name => "index_votes_on_voting_id_and_user_id", :unique => true

  create_table "votings", :force => true do |t|
    t.text     "question",                         :null => false
    t.string   "permalink",                        :null => false
    t.string   "user_login",                       :null => false
    t.integer  "user_id",                          :null => false
    t.text     "options_cache"
    t.boolean  "public",        :default => true,  :null => false
    t.boolean  "closed",        :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votings", ["permalink"], :name => "index_votings_on_permalink", :unique => true
  add_index "votings", ["question"], :name => "index_votings_on_question"

end
