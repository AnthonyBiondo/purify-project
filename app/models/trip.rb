class Trip < ApplicationRecord
  belongs_to :user

  has_many :transports
  has_many :compensationTrips
  has_many :compensations, through: :compensationTrip
end
