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

ActiveRecord::Schema.define(:version => 20130910022439) do

  create_table "buys", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.float    "count"
    t.integer  "count_type_id"
    t.float    "price"
    t.integer  "price_type"
    t.integer  "city_id"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "region_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "buys", ["category_id"], :name => "index_buys_on_category_id"
  add_index "buys", ["city_id"], :name => "index_buys_on_city_id"
  add_index "buys", ["region_id"], :name => "index_buys_on_region_id"
  add_index "buys", ["subcategory_id"], :name => "index_buys_on_subcategory_id"
  add_index "buys", ["user_id"], :name => "index_buys_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "default_image"
    t.integer  "sort_id",       :default => 0, :null => false
  end

  add_index "categories", ["sort_id"], :name => "index_categories_on_sort_id"

  create_table "categories_profiles", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "profile_id"
  end

  add_index "categories_profiles", ["category_id", "profile_id"], :name => "index_categories_profiles_on_category_id_and_profile_id"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["region_id"], :name => "index_cities_on_region_id"

  create_table "count_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ga_pageviews_records", :force => true do |t|
    t.string   "model_type",                      :null => false
    t.integer  "model_id",                        :null => false
    t.integer  "pageviews",        :default => 0, :null => false
    t.integer  "unique_pageviews", :default => 0, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body",       :limit => 255
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.text     "body_cache", :limit => 255
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "name"
    t.integer  "inn"
    t.integer  "city_id"
    t.integer  "region_id"
    t.string   "address"
    t.string   "phone"
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "profiles", ["city_id"], :name => "index_profiles_on_city_id"
  add_index "profiles", ["region_id"], :name => "index_profiles_on_region_id"
  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "profiles_subcategories", :id => false, :force => true do |t|
    t.integer "subcategory_id"
    t.integer "profile_id"
  end

  add_index "profiles_subcategories", ["subcategory_id", "profile_id"], :name => "index_profiles_subcategories_on_subcategory_id_and_profile_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sells", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.float    "count"
    t.integer  "count_type_id"
    t.float    "price"
    t.integer  "price_type"
    t.integer  "city_id"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "region_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "sells", ["category_id"], :name => "index_sells_on_category_id"
  add_index "sells", ["city_id"], :name => "index_sells_on_city_id"
  add_index "sells", ["region_id"], :name => "index_sells_on_region_id"
  add_index "sells", ["subcategory_id"], :name => "index_sells_on_subcategory_id"
  add_index "sells", ["user_id"], :name => "index_sells_on_user_id"

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "default_image"
    t.integer  "sort_id",       :default => 0, :null => false
  end

  add_index "subcategories", ["category_id"], :name => "index_subcategories_on_category_id"
  add_index "subcategories", ["sort_id"], :name => "index_subcategories_on_sort_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
