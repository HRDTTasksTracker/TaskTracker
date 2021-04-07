# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :claimed_by
      t.string :task_name
      t.text :task_description
      t.datetime :due_date
      t.integer :child_task_id
      t.string :tag

      t.timestamps
    end
  end
end
