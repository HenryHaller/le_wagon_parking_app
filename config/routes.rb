Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :spots, only: [:index, :create, :destroy]
  resources :cars, only: [:index, :new, :create, :destroy]
  resources :spots, only: [:new, :create, :delete] do
    resources :bookings, shallow: true
  end
  resources :bookings, only: [:index]
  post "results", to: "spots#results"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
