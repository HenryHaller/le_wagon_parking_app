class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :begin
      t.datetime :end
      t.references :car, foreign_key: true
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
