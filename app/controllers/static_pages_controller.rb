class StaticPagesController < ApplicationController
  def home
  end

  def booking
    @bookings = Booking.all
  end

  def about
  end
end
