class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:dashboard, :kitchen, :turnover, :metrics]

  def home
    #code
  end

  def turnover
    #code
  end

  def metrics
    #code
  end

  def index
    @restaurants = Restaurant.all
  end

  def dashboard
    @tables = @restaurant.tables
    @orders_all =  @restaurant.orders
    @orders_pending = @restaurant.orders.where(status: 'pending')
    @orders_in_process = @restaurant.orders.where(status: 'in process').order(:time).reverse
    @orders_delivered = @restaurant.orders.where(status: 'delivered').order(:time).reverse
    @orders_deleted = @restaurant.orders.where(status: 'deleted')
    @orders_not_yet_paid = @restaurant.orders.where(paid: false) - @orders_deleted - @orders_pending

    @dangerous_orders = []
    @orders_not_yet_paid.each do |order|
      if (Time.now - order.time) > 60.minutes
        @dangerous_orders << order
      end
    end
    @dangerous_orders

    @active_orders = @orders_in_process + @orders_delivered

    @active_tables = 0
    @restaurant.tables.each do |table|
      if (table.orders - @orders_deleted - @orders_pending).any?
        @active_tables += 1
      end
    end
    @active_tables

    @occupied_tables = (@active_tables.to_f/@tables.count.to_f) * 100

  end

  def kitchen
    @restaurant.status_kitchen
    redirect_to restaurant_dashboard_path(@restaurant)
  end
end
