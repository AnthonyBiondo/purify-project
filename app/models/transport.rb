class Transport < ApplicationRecord
  belongs_to :trip, optional: true
end
