Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'

  get '/users/', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'posts', to: 'posts#index'
  get "/users/:id/posts/new", to: "posts#new", as: 'new_post'
  post "/users/:id/posts", to: "posts#create" 
  get "/users/:id/posts/:id/comments/new", to: "comments#new", as: 'new_comment'
  post "/users/:id/posts/:id/comments", to: "comments#create", as: 'comments'
  post "/users/:id/posts/:id", to: "likes#create", as: 'likes'

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end
