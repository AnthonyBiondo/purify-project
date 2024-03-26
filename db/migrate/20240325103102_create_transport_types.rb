class CreateTransportTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :transport_types do |t|
      t.string :name
      t.integer :fuel_consumption
      t.timestamps
    end
  end
end
