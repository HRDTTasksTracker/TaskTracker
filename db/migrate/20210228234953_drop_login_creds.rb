class DropLoginCreds < ActiveRecord::Migration[6.1]
  def up
    drop_table :login_creds
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
