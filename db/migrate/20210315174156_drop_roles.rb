# frozen_string_literal: true

class DropRoles < ActiveRecord::Migration[6.1]
  def up
    drop_table :roles
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
