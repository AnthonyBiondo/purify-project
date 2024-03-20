class CreateTransports < ActiveRecord::Migration[7.1]
  def change
    create_table :transports do |t|
      t.string :transport_type
      t.integer :duration
      t.integer :distance
      t.integer :co2_capacity

      t.timestamps
    end
  end
end
