class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :claims, through: :posts, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :cuisine, presence: true
end
