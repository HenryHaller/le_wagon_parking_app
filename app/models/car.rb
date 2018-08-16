class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :license_plate, presence: true

  mount_uploader :photo, PhotoUploader

  def name
    "#{self.year} #{self.make} #{self.model}"
  end

  # mount_uploader :photo, PhotoUploader
end
