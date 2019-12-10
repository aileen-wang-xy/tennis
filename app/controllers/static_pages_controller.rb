class StaticPagesController < ApplicationController
  def home
  end

  def booking
    boo = params[:court_id]
    if boo==nil
      boo = 1
    end
    @bookings = Booking.where(court_id: boo)
    @courts = Court.all
  end

  def about
  end
  
  def paid
    # redirect_to "/cart/clear"
    flash[:notice] = 'Transaction Complete'
    @order = Order.find(params[:id])
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")
    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    # update bookings is_booked column with true
    @bookings = Booking.where(user_id: current_user.id).where(is_booked: [nil, false])
    @bookings.each do |booking|
      booking.update_attribute(:is_booked , true)
    end
    redirect_to '/orders'
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:court_id, :start_time, :duration, :user_id)
  end
  
end
