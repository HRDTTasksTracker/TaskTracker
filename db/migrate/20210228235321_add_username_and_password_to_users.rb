# frozen_string_literal: true

class AddUsernameAndPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :password, :string
  end
end
