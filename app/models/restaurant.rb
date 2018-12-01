class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :claims, through: :posts, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :cuisine, presence: true
end
