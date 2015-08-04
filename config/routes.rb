Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :posts do
    resources :comments, only: [:show, :index, :new, :create]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
