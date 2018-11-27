class Post < ApplicationRecord
  belongs_to :restaurant

  validates :name, presence: true
  validates :original_price, numericality: true
  validates :discount, numericality: { less_than: 1 }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
