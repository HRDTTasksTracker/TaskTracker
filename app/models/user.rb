# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :email, presence: true
  validates :role, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :phone, presence: true, length: { minimum: 10 }
  validates :phone, presence: true, length: { maximum: 10 }
  validates :full_name, presence: true
  validates :username, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }
  validates :email, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }
  validates :full_name, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }
  validates :password, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }
  validates :phone, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }
  validates :discord_username, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }

  before_validation :strip_whitespace

  private

  def strip_whitespace
    self.email = email.strip unless email.nil?
    self.role = role.strip unless role.nil?
  end
end
