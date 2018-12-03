class Post < ApplicationRecord
  belongs_to :restaurant
  has_many :claims

  validates :name, presence: true
  validates :original_price, numericality: true
  validates :discount, numericality: { greater_than: 0, less_than_or_equal_to: 1 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_must_be_after_start
  # validate :start_must_be_after_now

  def everyday_enum
    ['yes', 'no']
  end

  def discount_price
    return original_price*discount
  end

  def end_must_be_after_start
    if start_time >= end_time
      errors.add(:end_time, "End time must be greater than start time")
    end
  end

  # def start_must_be_after_now
  #   if start_time >= Time.now
  #     errors.add(:start_time, "Start time must be after current time")
  #   end
  # end
end
