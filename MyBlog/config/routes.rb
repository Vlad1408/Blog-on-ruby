Rails.application.routes.draw do
  devise_for :users
root 'posts#index'
resources :posts,only: [:show,:index] do
  resources :comments
end
resources:tags, only:[:show]
resources :categories,only: [:show]

namespace :admin do
  resources :posts,except: [:show, :index]
  resources :categories,except: :show
end
end
