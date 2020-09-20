# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_17_224555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "email_campaigns", force: :cascade do |t|
    t.string "campaign_name"
    t.string "email_sender", default: "do-not-reply@simondata.com"
    t.string "discount_code"
    t.integer "discount_rate"
    t.integer "max_send_per_user", default: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "email_campaign_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["email_campaign_id"], name: "index_users_on_email_campaign_id"
  end

  add_foreign_key "users", "email_campaigns"
end
