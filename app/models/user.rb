class User < ApplicationRecord
    has_one :login_cred
end
