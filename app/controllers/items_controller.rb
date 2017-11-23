class ItemsController < ApplicationController
  before_action :set_table, only: [:index, :basket_summary, :current_order, :confirmation_summary]
  before_action :set_restaurant, only: [:index, :basket_summary, :confirmation_summary]
  before_action :items_quantity

  def index
    @items = {}
    @categories = @restaurant.list_of_categories
    @categories.each do |category|
      @items_category = @restaurant.items.where(category: category)
      @items[category.to_s] = @items_category
    end
    @items
    @orderline = Orderline.new
    @order = current_order
    @price = price_computation_vat(@order)
    @total_price = @price[:total]
  end

  def basket_summary
    @order = current_order
    @price = price_computation_vat(@order)
    @order.amount = @price[:total]
    @order.save!
    @vat = @price[:vat]
    @subtotal = @price[:subtotal]
  end

  def confirmation_summary
    @order = order = Order.find((params[:id]))
    @orderlines = Order.find(params[:id]).orderlines
    @time = Time.now + 20.minutes
    @price = price_computation_vat(@order)
    @vat = @price[:vat]
    @subtotal = @price[:subtotal]
  end

  private

  def items_quantity
    @order = current_order
    @quantity = 0
    @order.orderlines.each do |orderline|
      @quantity += orderline.quantity
    end
    @quantity
  end

  def price_computation_vat(the_order)
    order = the_order
    total = 0
    vat = 0
    order.orderlines.each do |orderline|
      a = orderline.quantity * orderline.item.vat/10000.to_f * orderline.item.price
      vat += a
      t = orderline.quantity * orderline.item.price
      total += t
    end
    return price = {total: total, vat: vat, subtotal: total - vat}
  end

  def set_table
    @table = Table.find(params[:table_id])
  end

  def current_order
    if session[:order_id] == true || Order.where(id: session[:order_id]).any?
      order = Order.find(session[:order_id])
      order.save!
      return order
    else
      order = Order.new(table: @table, status: "pending")
      order.number = 0
      order.save!
      session[:order_id] = order.id
      return order
    end
  end
end
