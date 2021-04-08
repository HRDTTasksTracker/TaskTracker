# frozen_string_literal: true

class ValidEmail < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
