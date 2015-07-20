Rails.application.routes.draw do
  get 'advertisement/index'

  get 'advertisement/show'

  resources :post
  resources :advertisement
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
