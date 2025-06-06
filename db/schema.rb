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

ActiveRecord::Schema[8.0].define(version: 2025_04_25_232826) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pg_catalog.plpgsql'

  create_table 'locations', force: :cascade do |t|
    t.bigint 'space_id', null: false
    t.bigint 'timezone_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['space_id'], name: 'index_locations_on_space_id'
    t.index ['timezone_id'], name: 'index_locations_on_timezone_id'
  end

  create_table 'spaces', force: :cascade do |t|
    t.string 'token'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'timezones', force: :cascade do |t|
    t.string 'tz'
    t.string 'utc'
    t.string 'names', default: [], array: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'locations', 'spaces'
  add_foreign_key 'locations', 'timezones'
end
