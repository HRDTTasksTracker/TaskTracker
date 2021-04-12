# frozen_string_literal: true

class ValidEmail < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }
end
