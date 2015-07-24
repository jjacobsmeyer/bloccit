Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :summaries
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
