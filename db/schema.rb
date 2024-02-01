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

ActiveRecord::Schema[7.1].define(version: 2024_01_31_213021) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "descendents", force: :cascade do |t|
    t.string "first_name"
    t.bigint "family_id", null: false
    t.boolean "female"
    t.integer "languages_spoken", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_descendents_on_family_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.string "relationship_type"
    t.integer "porter_descendent_id"
    t.integer "porter_relationship_id"
    t.boolean "children"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "descendents", "families"
  add_foreign_key "relationships", "descendents", column: "porter_descendent_id"
  add_foreign_key "relationships", "descendents", column: "porter_relationship_id"
end
