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

ActiveRecord::Schema.define(:version => 20130314093035551) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.text     "content"
    t.integer  "ispublished",  :default => 0
    t.string   "releasemonth", :default => "December"
    t.string   "image"
    t.integer  "user_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "coupons", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "metadata"
    t.string   "alpha_code"
    t.string   "alpha_mask"
    t.string   "digit_code"
    t.string   "digit_mask"
    t.string   "category_one"
    t.float    "amount_one",        :default => 0.0
    t.float    "percentage_one",    :default => 0.0
    t.string   "category_two"
    t.float    "amount_two",        :default => 0.0
    t.float    "percentage_two",    :default => 0.0
    t.date     "expiration"
    t.integer  "how_many",          :default => 1
    t.integer  "redemptions_count", :default => 0
    t.integer  "integer",           :default => 0
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "coupons", ["alpha_code"], :name => "index_coupons_on_alpha_code"
  add_index "coupons", ["digit_code"], :name => "index_coupons_on_digit_code"

  create_table "course_previews", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "video_url"
    t.integer  "sequence"
    t.integer  "enable"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "course_id"
  end

  create_table "course_pricings", :force => true do |t|
    t.integer  "course_id"
    t.float    "price"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_statuses", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "image"
    t.text     "desc"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "user_id"
    t.integer  "ispublished",      :default => 0
    t.string   "releasemonth",     :default => "December"
    t.integer  "ispopular"
    t.string   "content_type"
    t.binary   "data"
    t.integer  "lms_id"
    t.integer  "topic_id"
    t.string   "short_desc"
    t.boolean  "isconcluded"
    t.string   "concluded_review"
    t.date     "concluded"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_coming_soon"
  end

  add_index "courses", ["title", "author"], :name => "index_courses_on_title_and_author"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "faqs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "order_id"
    t.text     "question"
    t.text     "answer"
  end

  create_table "groupings", :force => true do |t|
    t.integer  "group_id"
    t.integer  "tutorial_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.date     "due_at"
    t.date     "paid_at"
    t.decimal  "total"
    t.string   "company_name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "invoice_number"
    t.string   "bill_to"
    t.string   "notes"
    t.decimal  "tax_rate"
    t.string   "tax_description"
    t.decimal  "coupon_rate"
    t.string   "coupon_code"
    t.string   "coupon_description"
    t.string   "currency"
    t.string   "invoice_details"
    t.integer  "user_id"
    t.integer  "course_id"
  end

  create_table "line_items", :force => true do |t|
    t.decimal  "price"
    t.string   "description"
    t.integer  "quantity"
    t.integer  "display_price"
    t.integer  "display_quantity"
    t.integer  "invoice_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "invoice_number"
    t.string   "item_type"
  end

  create_table "o_classes", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "no_of_days"
    t.integer  "no_of_hours_per_day"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time_of_day"
    t.time     "end_time_of_day"
    t.integer  "no_of_student_per_class"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "user_id"
  end

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "rating_caches", :force => true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            :null => false
    t.integer  "qty",            :null => false
    t.string   "dimension"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], :name => "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "redemptions", :force => true do |t|
    t.integer  "coupon_id"
    t.string   "user_id"
    t.string   "transaction_id"
    t.text     "metadata"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "course_id"
    t.integer  "topic_id"
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

  create_table "student_courses", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "status"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "contact_no"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "blog_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tax_rates", :force => true do |t|
    t.date     "valid_from",                                :null => false
    t.date     "valid_until"
    t.decimal  "factor",      :precision => 2, :scale => 2
    t.boolean  "is_default"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "description"
  end

  create_table "teaching_staff_courses", :force => true do |t|
    t.integer  "course_id"
    t.integer  "teaching_staff_id"
    t.string   "teaching_staff_type"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "teaching_staffs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "qualification"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "desc"
    t.string   "color"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.binary   "omni_image_url"
    t.string   "provider",               :default => "signup"
    t.string   "phone"
    t.string   "user_type"
    t.string   "sub_plan"
    t.string   "user_desc"
    t.string   "name"
    t.string   "username"
    t.integer  "lms_id"
    t.string   "attachment"
    t.string   "content_type"
    t.binary   "image_blob"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
