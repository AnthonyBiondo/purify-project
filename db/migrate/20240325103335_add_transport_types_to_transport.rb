class AddTransportTypesToTransport < ActiveRecord::Migration[7.1]
  def change
    add_reference :transports, :transport_type, foreign_key: true
  end
end
