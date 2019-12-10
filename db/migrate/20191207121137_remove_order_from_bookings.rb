class RemoveOrderFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bookings, :order, foreign_key: true
  end
end
