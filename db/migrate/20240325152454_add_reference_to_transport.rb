class AddReferenceToTransport < ActiveRecord::Migration[7.1]
  def change
    add_reference :transports, :trip, foreign_key: true
  end
end
