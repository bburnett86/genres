class Genre < ApplicationRecord

  validates :name, :image, :text, presence: true
  validates :name, :image, :text, uniqueness: true

  has_many :selections
  has_many :users, through: :selections

end
