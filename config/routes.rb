Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :spots, only: [:index, :create]
  resources :cars, only: [:index, :new, :create, :delete]
  resources :spots, only: [:new, :create, :delete] do
    resources :bookings, shallow: true
  end
  resources :bookings, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
