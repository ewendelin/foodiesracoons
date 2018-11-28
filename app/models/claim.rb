class Claim < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one :restaurant, through: :post

  def status_enum
    ['received', 'rejected', 'not-show', 'confirmed']
  end
end
