Rails.application.routes.draw do
  resources :post

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
