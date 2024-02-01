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

ActiveRecord::Schema[7.1].define(version: 2024_02_01_021253) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.bigint "surname_id", null: false
    t.boolean "female"
    t.integer "languages_spoken", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parents_id"
    t.index ["parents_id"], name: "index_children_on_parents_id"
    t.index ["surname_id"], name: "index_children_on_surname_id"
  end

  create_table "parents", force: :cascade do |t|
    t.integer "mother_id"
    t.integer "father_id"
    t.boolean "married"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surnames", force: :cascade do |t|
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "children", "parents", column: "parents_id"
  add_foreign_key "children", "surnames"
  add_foreign_key "parents", "children", column: "father_id"
  add_foreign_key "parents", "children", column: "mother_id"
end
