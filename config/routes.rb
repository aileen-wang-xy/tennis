Rails.application.routes.draw do
  
  resources :courts
  resources :orders do 
    resources:bookings
  end
 
  devise_for :users do 
    resources :orders 
  end
  
  resources :bookings
  
  root 'static_pages#home'
  
  get '/booking' => 'static_pages#booking'
  get '/about' => 'static_pages#about'
  
  get '/login' => 'user#login' 
  get '/logout' => 'user#logout'
  
  get '/cart/', to: 'cart#index'
  get '/cart/:id', to: 'cart#add'
  
  get '/checkout' => 'cart#createOrder'

  get '/paid/:id' => 'static_pages#paid'
  
  
  # get 'static_pages/home'
  # get 'static_pages/booking'
  # get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
