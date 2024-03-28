class Trip < ApplicationRecord
  belongs_to :user
  has_one :transport, dependent: :destroy
  has_one :transportTypes, through: :transport

  has_many :compensation_trips
  has_many :compensations, through: :compensation_trips
    # geocoded_by :destination
    # after_validation :geocode, if: :will_save_change_to_destination?

    def name
      "#{destination} / #{departure}"
    end
end
