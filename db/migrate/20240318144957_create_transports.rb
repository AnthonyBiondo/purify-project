class CreateTransports < ActiveRecord::Migration[7.1]
  def change
    create_table :transports do |t|
      t.string :type
      t.integer :duration
      t.integer :distance
      t.integer :co2_capacity
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
