Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "listings#index"

  resources :users, only: %i[new create index]
  resources :reservations
  resources :listings
  resources :wishlists, only: %i[new create destroy] do
    resources :bookmarks, only: %i[create destroy]
  end
end
