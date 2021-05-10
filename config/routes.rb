Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/home',   to: 'static_pages#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post   '/guest_login',   to: 'sessions#create_guest'
  resources :users
  get    '/following',   to: 'users#following'
  get    '/follower',   to: 'users#follower'
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  get    '/follow_posts',   to: 'posts#index_follow'
  resources :topics do
    resources :comments
  end
  resources :contests
  resources :votes, only: [:create, :destroy]
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'closed_contests' => 'contests#index_closed'
end
