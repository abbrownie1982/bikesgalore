Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => "user_registration" }
  
  resources :users
  
  resources :products do
    resources :comments
    resources :orders, only: [:index, :show, :create, :destroy]
  end
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'
  
  get 'static_pages/landing_page'
  
  get 'static_pages/payment_thanks'
  
  post 'payments/create'
  
  root 'static_pages#index'
  
  mount ActionCable.server => '/cable'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end