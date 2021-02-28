class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :role
      t.string :email
      t.string :discord_username
      t.string :phone

      t.timestamps
    end
  end
end
