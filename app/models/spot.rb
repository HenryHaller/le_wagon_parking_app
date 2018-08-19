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

  # def available_spots(begin_time, end_time)
  #   self.joins(:bookings).where("bookings.begin < ")
  # end
  def check_availibility(potential_booking)
    answer =  self.bookings.none? { |booking| overlaps?(potential_booking, booking) }
    puts "#{answer} #{self.site_name}"
    return answer
  end

  def overlaps?(b1, b2)
    b1begin = b1.begin.to_i
    b2begin = b2.begin.to_i

    b1end = b1.end.to_i
    b2end = b2.end.to_i

    return true if b1begin >= b2begin && b1begin <= b2end
    return true if b1end >= b2begin && b1end <= b2end
    return true if b1begin <= b2begin && b1end >= b2end
    return false
  end


end
