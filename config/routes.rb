Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "lists#index"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:create, :new, :destroy]
    resources :reviews, only: [:create]
  end
end
