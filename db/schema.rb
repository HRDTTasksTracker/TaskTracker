# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
@@ -12,43 +10,45 @@
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_321_193_013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'roles', force: :cascade do |t|
    t.string 'role_name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'tasks', force: :cascade do |t|
    t.integer 'claimed_by'
    t.string 'task_name'
    t.text 'task_description'
    t.datetime 'due_date'
    t.integer 'child_task_id'
    t.string 'tag'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'full_name'
    t.string 'role'
    t.string 'email'
    t.string 'discord_username'
    t.string 'phone'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'username'
    t.string 'password'
  end

  create_table 'valid_emails', force: :cascade do |t|
    t.string 'email'
    t.boolean 'in_use'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

end
