Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants

  get "restaurants/:restaurant_id/reviews/new", to: "reviews#new"

  # Defines the root path route ("/")
  # root "articles#index"
end
