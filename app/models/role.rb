class Role < ApplicationRecord
    validates :role_name, presence: true, uniqueness: true, length: { minimum: 3 }
end
