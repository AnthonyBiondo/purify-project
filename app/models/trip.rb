class Trip < ApplicationRecord
  belongs_to :user

  has_one :transport
  has_many :compensationTrips
  has_many :compensations, through: :compensationTrip
end
