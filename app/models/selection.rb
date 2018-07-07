class Selection < ApplicationRecord

  validates :genre_id, :user_id, presence: true
  validates :genre_id, :user_id, numericality: { only_integer: true }

  belongs_to :genre
  belongs_to :user
end
