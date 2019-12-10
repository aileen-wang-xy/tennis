class RemoveCourtNameFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :court_name, :string
  end
end
