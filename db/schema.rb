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

  create_table "fathers", force: :cascade do |t|
    t.bigint "persons_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persons_id"], name: "index_fathers_on_persons_id"
  end

  create_table "mothers", force: :cascade do |t|
    t.bigint "persons_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persons_id"], name: "index_mothers_on_persons_id"
  end

  create_table "parents", force: :cascade do |t|
    t.bigint "mothers_id", null: false
    t.bigint "fathers_id", null: false
    t.boolean "married"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fathers_id"], name: "index_parents_on_fathers_id"
    t.index ["mothers_id"], name: "index_parents_on_mothers_id"
  end

  create_table "persons", force: :cascade do |t|
    t.string "first_name"
    t.bigint "surname_id", null: false
    t.integer "maiden_name_id"
    t.boolean "female"
    t.integer "languages_spoken", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surname_id"], name: "index_persons_on_surname_id"
  end

  create_table "surnames", force: :cascade do |t|
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fathers", "persons", column: "persons_id"
  add_foreign_key "mothers", "persons", column: "persons_id"
  add_foreign_key "parents", "fathers", column: "fathers_id"
  add_foreign_key "parents", "mothers", column: "mothers_id"
  add_foreign_key "persons", "surnames"
  add_foreign_key "persons", "surnames", column: "maiden_name_id"
end
