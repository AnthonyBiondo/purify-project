class Compensation < ApplicationRecord
  has_many :compensation_trips, dependent: :destroy
end
