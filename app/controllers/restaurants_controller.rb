class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def dashboard
    restaurant = Restaurant.first
    @orders_all =  restaurant.orders
    @orders_in_process = restaurant.orders.where(status: 'in process')
    @orders_delivered = restaurant.orders.where(status: 'delivered')
    @orders_paid = restaurant.orders.where(status: 'paid')
    @orders_deleted = restaurant.orders.where(status: 'deleted')
  end

end
