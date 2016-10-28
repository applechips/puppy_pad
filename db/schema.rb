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

ActiveRecord::Schema.define(version: 20161028001047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "time"
    t.string   "time_zone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "breeders", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "breed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "medical_records", force: :cascade do |t|
    t.string   "date"
    t.string   "condition_procedure"
    t.string   "charges"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "weight"
    t.integer  "pet_id"
    t.index ["pet_id"], name: "index_medical_records_on_pet_id", using: :btree
  end

  create_table "pet_photos", force: :cascade do |t|
    t.string   "caption"
    t.string   "date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "pet_id"
    t.string   "images",     default: [],              array: true
    t.index ["pet_id"], name: "index_pet_photos_on_pet_id", using: :btree
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.string   "sex"
    t.string   "colour"
    t.string   "breeder"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image"
    t.integer  "user_id"
    t.string   "birthday"
    t.string   "birthday_month"
    t.string   "birthday_year"
    t.string   "cover_photo"
    t.index ["user_id"], name: "index_pets_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "body"
    t.integer  "star_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", using: :btree
  end

  create_table "vets", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "postal_code"
    t.string   "city"
    t.string   "province_state"
    t.string   "country"
    t.string   "dr_name"
    t.integer  "user_id"
    t.integer  "pet_id"
    t.index ["pet_id"], name: "index_vets_on_pet_id", using: :btree
    t.index ["user_id"], name: "index_vets_on_user_id", using: :btree
  end

  add_foreign_key "medical_records", "pets"
  add_foreign_key "pet_photos", "pets"
  add_foreign_key "pets", "users"
  add_foreign_key "vets", "pets"
  add_foreign_key "vets", "users"
end
