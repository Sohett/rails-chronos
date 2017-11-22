class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:dashboard, :kitchen]

  def home
    #code
  end

  def index
    @restaurants = Restaurant.all
  end

  def dashboard
    @tables = @restaurant.tables
    @orders_all =  @restaurant.orders
    @orders_pending = @restaurant.orders.where(status: 'pending')
    @orders_in_process = @restaurant.orders.where(status: 'in process')
    @orders_delivered = @restaurant.orders.where(status: 'delivered')
    @orders_paid = @restaurant.orders.where(status: 'paid')
    @orders_deleted = @restaurant.orders.where(status: 'deleted')
  end

  def kitchen
    @restaurant.status_kitchen
    redirect_to restaurant_dashboard_path(@restaurant)
  end
end
