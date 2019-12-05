Rails.application.routes.draw do
  
  resources :bookings
  devise_for :users
  
  root 'static_pages#home'
  
  get '/bookingsheet' => 'static_pages#booking'
  
  get '/about' => 'static_pages#about'
  
  root :to => 'static_pages#home'
  
  get '/login' => 'user#login' 
  get '/logout' => 'user#logout'

  
  # get 'static_pages/home'
  # get 'static_pages/booking'
  # get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
