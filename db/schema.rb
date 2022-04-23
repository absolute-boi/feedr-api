# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_22_223826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caterers", force: :cascade do |t|
    t.string "address", null: false
    t.string "name", null: false
    t.string "city", null: false
    t.string "cloudinary_image_url"
    t.text "description", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "radius_drop_off", default: 25, null: false
    t.integer "radius_on_site", default: 25, null: false
    t.integer "radius_pick_up", default: 25, null: false
    t.string "slug", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["latitude", "longitude"], name: "index_caterers_on_latitude_and_longitude"
    t.index ["name"], name: "index_caterers_on_name"
    t.index ["slug"], name: "index_caterers_on_slug"
  end

end
