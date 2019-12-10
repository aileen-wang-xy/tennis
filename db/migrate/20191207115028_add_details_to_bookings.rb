class AddDetailsToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :order, foreign_key: true
  end
end
