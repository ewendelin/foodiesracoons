class Claim < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one :restaurant, through: :post

  def status_enum
    ['received', 'rejected', 'not-show', 'confirmed']
  end

  def active_inactive
    if status == "in progress"
      return "active"
    else
      return "inactive"
    end
  end
  def claimed_at
    s = super
    return nil if s.nil?
    s.in_time_zone('Beijing')
  end
end
