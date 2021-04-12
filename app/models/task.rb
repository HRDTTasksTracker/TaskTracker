# frozen_string_literal: true

class Task < ApplicationRecord
  validates :task_name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :task_name, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }
  validates :task_description, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }
  validates :tag, format: { with: /\A[\w\d._@\ ]*\z/, message: 'Please do not use special characters.' }
end
