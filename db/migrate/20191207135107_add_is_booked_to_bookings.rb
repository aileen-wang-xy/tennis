class AddIsBookedToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :is_booked, :boolean, :default => false
  end
end
