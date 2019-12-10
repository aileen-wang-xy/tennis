class AddCourtToBooking < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :court, foreign_key: true
  end
end
