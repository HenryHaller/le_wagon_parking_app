class Spot < ApplicationRecord
  belongs_to :user
  validates :site_name, :address, :user, :location, :description, presence: true
  has_many :bookings
end
