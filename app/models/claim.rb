class Claim < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one :restaurant, through: :post

  def status_enum
    ['in progress','received', 'rejected', 'not-show', 'confirmed']
  end

  def active_inactive
    if status == "in progress"
      return "active"
    else
      return "inactive"
    end
  end
end
