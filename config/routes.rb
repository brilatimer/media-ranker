Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'works#index'
  resources :works
  
  resources :users do
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
      
      get "/login", to: "users#login_form", as: "login"
      post "/login", to: "users#login"
      post "/logout", to: "users#logout", as: "logout"
      get "/users/current", to: "users#current", as: "current_user"
      
      # get '/users', to: 'users#index', as: 'users'
      # get '/users/new', to: 'users#new', as: 'new_user'
      # post '/users', to: 'users#create'
      
    end
  end
end
