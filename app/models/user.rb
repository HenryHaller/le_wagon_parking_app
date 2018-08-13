class User < ApplicationRecord
  validates :first_name, :last_name, :email
end
