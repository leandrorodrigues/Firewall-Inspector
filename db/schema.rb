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

ActiveRecord::Schema.define(version: 0) do

  create_table "negative_tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "test_name",      limit: 100,                 null: false
    t.boolean "active",                     default: false, null: false
    t.boolean "result_must_be",             default: false, null: false
    t.index ["test_name"], name: "class_name_UNIQUE", unique: true, using: :btree
  end

  create_table "positive_tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "test_name",      limit: 100,                 null: false
    t.boolean "active",                     default: false, null: false
    t.boolean "result_must_be",             default: false, null: false
    t.index ["test_name"], name: "class_name_UNIQUE", unique: true, using: :btree
  end

  create_table "suspects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "ip",                     null: false
    t.datetime "created"
    t.text     "test_log", limit: 65535
  end

end
