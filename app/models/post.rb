class Post < ApplicationRecord
  belongs_to :restaurant
  has_many :claims

  validates :name, presence: true
  validates :original_price, numericality: true
  validates :discount, numericality: { greater_than: 0, less_than_or_equal_to: 1 }
  validates :start_time, presence: true
  validates :end_time, presence: true

  def everyday_enum
    ['yes', 'no']
  end

 #  def end_must_be_after_start
 #   if :start_time >= :end_time
 #     errors.add(:end_time, "must be after start time")
 #   end
 # end
end
