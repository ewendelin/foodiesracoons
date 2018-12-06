class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :rating, numericality: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :content, allow_blank: true
end
