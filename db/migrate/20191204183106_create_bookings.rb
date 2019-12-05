class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :court_name
      t.datetime :start_time
      t.integer :duration
      t.decimal :price

      t.timestamps
    end
  end
end
