class Transport < ApplicationRecord
  belongs_to :trip, optional: true
  belongs_to :transport_type
end
