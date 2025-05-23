Rails.application.routes.draw do
  devise_for :users

  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  root 'hello#index'
  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end

   get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'

end
