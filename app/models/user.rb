# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :email, presence: true
  validates :role, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :full_name, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  before_validation :strip_whitespace

  private

  def strip_whitespace
    self.email = email.strip unless email.nil?
    self.role = role.strip unless role.nil?
  end
end
