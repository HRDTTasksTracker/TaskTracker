# frozen_string_literal: true

class AddWhitelistEmailsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :valid_emails do |t|
      t.string :email
      t.boolean :in_use

      t.timestamps
    end
  end
end
