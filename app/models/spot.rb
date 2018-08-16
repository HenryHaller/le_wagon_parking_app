class Spot < ApplicationRecord
  geocoded_by :address
  belongs_to :user
  validates :site_name, :address, :user, :hourly_rate, :description, presence: true
  has_many :bookings
  # after_initialize :default_values
  after_validation :geocode, if: :will_save_change_to_address?

  # private
  #   def default_values
  #     self.location ||= "default location"
  #   end


end
