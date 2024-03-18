class CompensationTrip < ApplicationRecord
  belongs_to :compensation
  belongs_to :trip
end
