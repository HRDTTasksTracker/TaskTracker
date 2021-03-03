class ValidEmail < ApplicationRecord
    validates :email, presence: true, uniqueness: true
end
