Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

  # Defines the index page to show all the articles 
  # get "/articles", to: "articles#index"

  # Defines a new route by user id to show a single article 
  # get "/articles/:id", to: "articles#show"

  resources :articles   
end
