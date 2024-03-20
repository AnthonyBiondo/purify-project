class AddTransportToTrips < ActiveRecord::Migration[7.1]
  def change
    add_reference :trips, :transport, foreign_key: true
  end
end
