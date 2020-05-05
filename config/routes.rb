Rails.application.routes.draw do

  

  resources :posts, controller: 'blog/posts'

  root to: "home#index"
  post "/login", to: "api/v1/auth#create"
  get "/login", to: "api/v1/auth#get"
 
  resources :user
end
