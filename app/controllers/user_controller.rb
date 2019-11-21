class UserController < ApplicationController
    def login
        session[:login] = 1
        session[:cart] = nil
        flash[:notice] = "Admin Login sucessfull!!"
        redirect_to '/booking'
    end 
    
    def logout
        session[:login] = nil
        session[:cart] = nil
        flash[:notice] = "You have been successfully logged out!!"
        redirect_to ''
    end 
end
