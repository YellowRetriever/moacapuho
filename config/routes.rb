Rails.application.routes.draw do
  devise_for :providers
  
    resources :items do
    collection do
      get "search"
    end#ransack検索機能
  end
    
  namespace :provider do
      resources :items
  end
  
  namespace :admin do
      resources :providers
  end
  
  resources :providers
  
  get "top", to: "top#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
