# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.boolean :admin
      t.boolean :manager
      t.boolean :member

      t.timestamps
    end
  end
end
