class ItemsController < ApplicationController
  before_action :set_table, only: [:index, :basket_summary]

  def index
    @restaurant = Restaurant.first
    @items = @restaurant.items
    @items_starters = @items.where(category: 'starters')
    @items_burgers = @items.where(category: 'burgers')
    @items_sides = @items.where(category: 'sides')
    @items_drinks = @items.where(category: 'drinks')

    @orderline = Orderline.new
    @order = current_order

    @total_price = price_computation_simple
    @quantity = 0
    @order.orderlines.each do |orderline|
      @quantity += orderline.quantity
    end
    @quantity
  end

  def basket_summary
    @order = current_order
    @total_price = price_computation_simple
  end

  private

  def price_computation_vat
    #code
  end

  def price_computation_simple
    total_price = 0
    @order = current_order
    @order.orderlines.each do |orderline|
      price = orderline.quantity * orderline.item.price
      total_price += price
    end
    total_price
  end

  def set_table
    @table = Table.find(params[:table_id])
  end

  def current_order
    unless session[:order_number]
      session[:order_number] = 1
    end

    unless session[:order_id] == true || Order.where(id: session[:order_id]).any?
      order = Order.new(table: @table, status: "pending")
      order.number = session[:order_number]
      order.save!
      session[:order_id] = order.id
      order
    else
      order = Order.find(session[:order_id])
      order.number = session[:order_number]
      return order
    end
  end
end
