class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :spot
  accepts_nested_attributes_for :car
  validates :car, presence: true
  validates :spot, presence: true
  validates :duration, presence: true
  validates :duration, numericality: { only_integer: true}
end
