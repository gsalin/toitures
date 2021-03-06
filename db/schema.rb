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

ActiveRecord::Schema.define(version: 20171107093533) do

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
    t.string   "slug"
    t.integer  "category"
    t.string   "caption"
    t.string   "caption2"
    t.index ["category"], name: "index_articles_on_category", using: :btree
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
    t.index ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
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
    t.boolean  "locaux_industriels"
    t.boolean  "architecte"
    t.boolean  "isolation"
    t.boolean  "batiment_agricole"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "job_ads", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "diploma"
    t.text     "description"
    t.integer  "experience"
    t.integer  "remuneration"
    t.string   "civilite"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "job_offers", force: :cascade do |t|
    t.string   "title"
    t.string   "job_type"
    t.integer  "reference"
    t.text     "description"
    t.string   "contact_name"
    t.string   "contact_phone_number"
    t.integer  "user_id"
    t.text     "mission"
    t.text     "profile"
    t.text     "diploma"
    t.integer  "experience"
    t.integer  "remuneration"
    t.datetime "job_start_date_time"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "needs", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "charpentier"
    t.boolean  "couvreur"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "slug"
    t.index ["slug"], name: "index_projects_on_slug", unique: true, using: :btree
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
    t.string   "slug"
    t.boolean  "qualibat"
    t.boolean  "rge"
    t.boolean  "mh"
    t.integer  "status"
    t.boolean  "looking_for_job"
    t.boolean  "charpentier"
    t.boolean  "couvreur"
    t.integer  "state",                  default: 1
    t.boolean  "locaux_industriels"
    t.string   "facebook"
    t.boolean  "ffb"
    t.string   "website"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "press_link_1"
    t.string   "press_link_title_1"
    t.string   "press_link_2"
    t.string   "press_link_title_2"
    t.string   "press_link_3"
    t.string   "press_link_title_3"
    t.boolean  "architecte"
    t.boolean  "isolation"
    t.boolean  "epv"
    t.string   "specialite1"
    t.string   "specialite2"
    t.string   "specialite3"
    t.boolean  "batiment_agricole"
    t.boolean  "capeb"
    t.boolean  "rge_eco_artisan"
    t.boolean  "mof"
    t.boolean  "artisan"
    t.boolean  "artisan_d_art"
    t.boolean  "maitre_artisan"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
    t.index ["state"], name: "index_users_on_state", using: :btree
    t.index ["status"], name: "index_users_on_status", using: :btree
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
    t.string   "phone_number"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "address"
    t.boolean  "looking_for_job"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "charpentier"
    t.boolean  "couvreur"
    t.string   "slug"
    t.index ["email"], name: "index_workers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_workers_on_slug", unique: true, using: :btree
  end

  add_foreign_key "articles", "categories"
end
