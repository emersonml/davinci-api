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

ActiveRecord::Schema.define(version: 2022_09_17_032527) do

  create_table "circuits", force: :cascade do |t|
    t.integer "sttus"
    t.string "name"
    t.string "description"
    t.integer "compartimento_id", null: false
    t.integer "kindbtn_id", null: false
    t.integer "kinddev_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["compartimento_id"], name: "index_circuits_on_compartimento_id"
    t.index ["kindbtn_id"], name: "index_circuits_on_kindbtn_id"
    t.index ["kinddev_id"], name: "index_circuits_on_kinddev_id"
  end

  create_table "compartimentos", force: :cascade do |t|
    t.string "name"
    t.integer "patrimonio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patrimonio_id"], name: "index_compartimentos_on_patrimonio_id"
  end

  create_table "kindbtns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kinddevs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patrimonios", force: :cascade do |t|
    t.string "name"
    t.integer "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "circuits", "compartimentos"
  add_foreign_key "circuits", "kindbtns"
  add_foreign_key "circuits", "kinddevs"
  add_foreign_key "compartimentos", "patrimonios"
end
