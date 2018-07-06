class User < ApplicationRecord
  has_secure_password

  has_many :selections
  has_many :genres, through: :selections
end
