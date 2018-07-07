class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :email, :password_digest, presence: true

  has_many :selections
  has_many :genres, through: :selections
end
