class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :user, presence: true
  validates :license_plate, presence: true
  def name
    "#{self.year} #{self.make} #{self.model}"
  end

  # mount_uploader :photo, PhotoUploader
end
