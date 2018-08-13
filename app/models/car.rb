class Car < ApplicationRecord
  belongs_to :user
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true, numeralicality: { only_integer: true }
  validates :user, presence: true
  validates :license_plate, presence: true
end
