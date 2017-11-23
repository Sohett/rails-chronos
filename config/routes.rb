Rails.application.routes.draw do
  root to: 'restaurants#home'

  get 'home', to:'restaurants#home', as: :home
  resources :restaurants, only: [:index] do
    put 'kitchen', to: 'restaurants#kitchen', as: :kitchen
    get 'dashboard', to:'restaurants#dashboard', as: :dashboard
    get 'statistics', to:'restaurants#statistics', as: :statistics
    resources :tables, only: [:index, :show] do

      resources :items, only: [:index]
      get 'items/basket', to:'items#basket_summary', as: :basket_summary
      get 'items/confirmation/orders/:id', to:'items#confirmation_summary', as: :confirmation_summary

      resources :orders, only: [:index, :update, :destroy] do
        resources :payments, only: [:new, :create]
      end
      delete 'orders', to:'orders#clear_table', as: :clear
      get 'orders/:id/delivered', to:'orders#delivered', as: :order_delivered
      get 'orders/:id/paid', to:'orders#paid', as: :order_paid
      get 'orders/:id/ticket', to: 'orders#ticket', as: :order_ticket

      resources :orderlines, only: [:create, :destroy]
      put 'orderlines/:id/increase', to:'orderlines#increase_item', as: :increase_item
      put 'orderlines/:id/decrease', to:'orderlines#decrease_item', as: :decrease_item
      delete 'orderlines/:id/cancel', to:'orderlines#cancel_item', as: :cancel_item

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
