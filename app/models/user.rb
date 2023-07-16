class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
