class CreateCompensationTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :compensation_trips do |t|
      t.integer :status
      t.references :compensation, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.timestamps
    end
  end
end
