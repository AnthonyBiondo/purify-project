class CreateCompensations < ActiveRecord::Migration[7.1]
  def change
    create_table :compensations do |t|
      t.string :name
      t.integer :co2_absorption
      t.timestamps
    end
  end
end
