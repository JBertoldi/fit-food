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

ActiveRecord::Schema.define(version: 2020_12_03_210325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doses", force: :cascade do |t|
    t.float "amount", null: false
    t.string "description"
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_doses_on_ingredient_id"
    t.index ["recipe_id"], name: "index_doses_on_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kcal", null: false
    t.integer "carbs", null: false
    t.integer "saturated_fats", null: false
    t.integer "unsaturated_fats", null: false
    t.integer "protein", null: false
    t.float "salt", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.text "instructions", null: false
    t.integer "kcal", null: false
    t.integer "carbs", null: false
    t.integer "saturated_fats", null: false
    t.integer "unsaturated_fats", null: false
    t.integer "protein", null: false
    t.float "salt", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "doses", "ingredients"
  add_foreign_key "doses", "recipes"
end
