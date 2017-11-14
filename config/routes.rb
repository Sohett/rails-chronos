Rails.application.routes.draw do
  root to: 'items#index'

  resources :items, only: [:index]
  resources :tables, only: [:show] do
    resources :orderlines, only: [:new, :create]
    resources :orders, only: [:index, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
