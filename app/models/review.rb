class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :rating, numericality: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :content, length: {minimum: 8}, allow_blank: true
end
