class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :spot
  accepts_nested_attributes_for :car
  validates :car, presence: true
  validates :spot, presence: true
  validates :begin, :end, presence: true
end
