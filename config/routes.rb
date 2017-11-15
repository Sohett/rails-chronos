Rails.application.routes.draw do
  root to: 'tables#index'

  resources :tables, only: [:index, :show] do
    resources :items, only: [:index]
    resources :orderlines, only: [:new, :create, :destroy]
    resources :orders, only: [:index, :update, :destroy]

    delete 'orders', to:'orders#clear_table', as: :clear
    get 'orders/:id', to:'orders#status', as: :order_status
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
