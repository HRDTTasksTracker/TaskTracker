# frozen_string_literal: true

class AddReferenceToUserInLoginCreds < ActiveRecord::Migration[6.1]
  def change
    add_reference :login_creds, :user, foreign_key: true
  end
end
