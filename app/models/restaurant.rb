class Restaurant < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true, uniqness: true
  validates :cuisine, presence: true
end
