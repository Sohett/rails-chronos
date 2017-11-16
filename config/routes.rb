Rails.application.routes.draw do
  root to: 'tables#index'

  resources :tables, only: [:index, :show] do
    resources :items, only: [:index]
    resources :orderlines, only: [:new, :create, :destroy]
    resources :orders, only: [:index, :update, :destroy]
    delete 'orders', to:'orders#clear_table', as: :clear
    get 'orders/:id', to:'orders#status', as: :order_status
    put 'orderlines/:id/increase', to:'orderlines#increase_item', as: :increase_item
    put 'orderlines/:id/decrease', to:'orderlines#decrease_item', as: :decrease_item
    delete 'orderlines/:id/cancel', to:'orderlines#cancel_item', as: :cancel_item

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
