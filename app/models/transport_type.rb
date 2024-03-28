class TransportType < ApplicationRecord
  has_one :transport, dependent: :destroy
end
