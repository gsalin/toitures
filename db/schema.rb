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

ActiveRecord::Schema.define(version: 20170615153124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "card_summary"
    t.text     "summary"
    t.integer  "category_id"
    t.integer  "user_id"
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "email"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "message"
    t.boolean  "construction",        default: false, null: false
    t.boolean  "renovation",          default: false, null: false
    t.boolean  "entretien",           default: false, null: false
    t.boolean  "maison",              default: false, null: false
    t.boolean  "chateau",             default: false, null: false
    t.boolean  "immeuble",            default: false, null: false
    t.boolean  "monument_historique", default: false, null: false
    t.boolean  "charpente",           default: false, null: false
    t.boolean  "couverture",          default: false, null: false
    t.boolean  "ouverture",           default: false, null: false
    t.boolean  "terrasse",            default: false, null: false
    t.boolean  "plomberie",           default: false, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.date     "date"
    t.integer  "cost"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "company"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.string   "office_phone"
    t.string   "mobile_phone"
    t.string   "address"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "radius",                 default: 50,    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "construction",           default: false, null: false
    t.boolean  "renovation",             default: false, null: false
    t.boolean  "entretien",              default: false, null: false
    t.boolean  "maison",                 default: false, null: false
    t.boolean  "chateau",                default: false, null: false
    t.boolean  "immeuble",               default: false, null: false
    t.boolean  "monument_historique",    default: false, null: false
    t.boolean  "charpente",              default: false, null: false
    t.boolean  "couverture",             default: false, null: false
    t.boolean  "ouverture",              default: false, null: false
    t.boolean  "terrasse",               default: false, null: false
    t.boolean  "plomberie",              default: false, null: false
    t.string   "city"
    t.string   "zip_code"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end


  create_table "workers", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_workers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true, using: :btree
  end
  
  add_foreign_key "articles", "categories"
end
