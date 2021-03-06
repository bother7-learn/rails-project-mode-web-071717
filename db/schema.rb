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

ActiveRecord::Schema.define(version: 20170824151501) do

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "home_goals"
    t.integer "away_goals"
    t.string "final_log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hometeam_id"
    t.integer "awayteam_id"
  end

  create_table "player_user_teams", force: :cascade do |t|
    t.integer "user_team_id"
    t.integer "player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shooting", default: 0
    t.integer "passing", default: 0
    t.integer "defense", default: 0
    t.integer "foul", default: 0
    t.integer "dribbling", default: 0
    t.string "position"
    t.integer "user_id"
    t.integer "contract", default:0
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.integer "ties", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
