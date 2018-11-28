class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :claims, through: :posts
  # has_many :reviews

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :cuisine, presence: true
end
