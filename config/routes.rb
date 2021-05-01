Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/home',   to: 'static_pages#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :topics do
    resources :comments
  end
  resources :contests
  resources :votes, only: [:create, :destroy]
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  post 'closed_contests' => 'contests#index_closed'
end
