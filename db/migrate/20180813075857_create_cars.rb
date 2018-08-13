class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :license_plate
      t.string :color
      t.integer :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
