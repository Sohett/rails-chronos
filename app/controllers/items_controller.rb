class ItemsController < ApplicationController
  before_action :set_table, only: [:index]

  def index
    @restaurant = Restaurant.first
    @items = @restaurant.items
    @items_starters = @items.where(category: 'starters')
    @items_burgers = @items.where(category: 'burgers')
    @items_sides = @items.where(category: 'sides')
    @items_drinks = @items.where(category: 'drinks')

    @orderline = Orderline.new
    @order = current_order

    @total_price = price_computation
  end

  private

  def price_computation
    total_price = 0
    @order = current_order
    @order.orderlines.each do |orderline|
      price = orderline.quantity * orderline.item.price
      total_price += price
    end
    return total_price
  end

  def set_table
    @table = Table.find(params[:table_id])
  end

  def current_order
    unless session[:order_id]
      order = Order.new(table: @table, status: "order in session")
      order.save!
      session[:order_id] = order.id
      order
    else
      Order.find(session[:order_id])
    end
  end
end
