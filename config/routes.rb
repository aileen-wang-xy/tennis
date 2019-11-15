Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get '/booking' => 'static_pages#booking'
  
  get '/about' => 'static_pages#about'
  
  
  # get 'static_pages/home'
  # get 'static_pages/booking'
  # get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
