class User < ApplicationRecord
    validates :username, presence: true
    validates :username, length: { minimum: 6 }
    validates :email, presence: true
    validates :password, presence: true
    validates :password, length: { minimum: 6 }
    validates :full_name, presence: true
end
