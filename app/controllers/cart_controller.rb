class CartController < ApplicationController

  def add
    # get the Id of the product
    id = params[:id]
    # if the cart is already been created, use existing cart else create a blank cart
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    # If the product is already added it increments by 1 else product set to 1
    if cart[id] then
      cart[id] = cart[id] + 1
    else
      cart[id]= 1
    end  
    redirect_to :action => :index
  end


  def clearCart
    #sets session variable to nil and bring back to index
    session[:cart] = nil
    redirect_to :action => :index
  end 


  
  def index
    @bookings = Booking.where(user_id: current_user.id).where(is_booked: [nil, false])
    @courts = Court.all
    # passes a cart to display
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
  
  def createOrder
    @orders = Order.last
    @bookings = Booking.where(user_id: current_user.id).where(is_booked: [nil, false])
    @courts = Court.all
    session[:cart] =nil
     
    # Step 1: Get the current user
    @user =User.find(current_user.id)
    # Step 2: Create a new order and associate it with the current user
    @order =@user.orders.build(:order_date => DateTime.now, :status => 'Pending')
    @order.save
  end     

end
