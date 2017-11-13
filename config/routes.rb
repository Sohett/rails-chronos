Rails.application.routes.draw do
root to: 'items#index'

  resources :restaurants, only: [:show, :index] do
    resources :items, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
