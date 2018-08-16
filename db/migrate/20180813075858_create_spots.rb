class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :site_name
      t.string :address
      t.text :description
      t.integer :hourly_rate
      # t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
