Rails.application.routes.draw do
  devise_for :users

  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  root 'hello#index'
  
  resources :users, only: [:show]
  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'

end
