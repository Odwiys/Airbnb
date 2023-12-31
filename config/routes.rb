Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: %i[new create index]

  resources :listings do
    resources :reservations, only: %i[index new create show]
  end

  resources :reservations, only: [] do
    member do
      get :approve, :reject
    end
  end

  # resources :reservations, only: %i[index]

  resources :wishlists, only: %i[new create destroy] do
    resources :bookmarks, only: %i[create destroy]
  end

  get "hosting", to: "pages#hosting"
  get "hosting/upcoming", to: "pages#upcoming"
end
