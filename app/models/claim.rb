class Claim < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one :restaurant, through: :post
  # status: 'received', 'no show', 'reject', 'confirm'
end
