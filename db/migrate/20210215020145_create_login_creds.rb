class CreateLoginCreds < ActiveRecord::Migration[6.1]
  def change
    create_table :login_creds do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
