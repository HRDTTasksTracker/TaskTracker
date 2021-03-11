class Task < ApplicationRecord
    validates :task_name, presence: true, uniqueness: true, length: { minimum: 3 }
end
