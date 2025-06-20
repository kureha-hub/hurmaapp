Rails.application.routes.draw do
  get "home/index"
  devise_for :users

  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  root 'home#index'
  
  resources :users, only: [:show]
  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :orders, only: [:create, :show, :destroy] do
    resources :messages, only: [:index, :create]
  end

  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'

end
