class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :spot
  validates :car, presence: true
  validates :spot, presence: true
  validates :duration, presence: true
  validates :duration, numericality: { only_integer: true}
end
