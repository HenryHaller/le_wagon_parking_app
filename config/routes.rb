Rails.application.routes.draw do
  root to: 'pages#home'
  resources :spots, only: [:index, :create]
  resources :cars, only: [:new, :create, :delete]
  resources :spots, only: [:new, :create, :delete] do
    resources :bookings, only: [:new]
  end
  resources: :bookings, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
