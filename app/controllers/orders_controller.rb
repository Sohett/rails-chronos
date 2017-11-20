class OrdersController < ApplicationController
  before_action :set_table, only: [:index, :update, :destroy, :clear_table, :delivered, :paid, :price_per_table]
  before_action :set_order, only: [:destroy, :delivered, :paid]
  before_action :set_restaurant, only: [:index, :update, :destroy, :delivered, :paid, :clear_table]

  def index
    @orders_all = @table.orders
    @orders_to_show = @table.orders - @table.orders.where(status: 'deleted') - @table.orders.where(status: 'pending')
    @orders_not_paid = @table.orders.where.not(status: 'paid') - @table.orders.where(status: 'deleted') - @table.orders.where(status: 'pending')
    @orders_pending = @table.orders.where(status: 'pending')
    @orders_in_process = @table.orders.where(status: 'in process')
    @orders_delivered = @table.orders.where(status: 'delivered')
    @orders_paid = @table.orders.where(status: 'paid')
    @total_price = price_per_table
  end

  def update
    @order = Order.find(session[:order_id])
    if @order.orderlines.any?
      if session[:order_id]
        session.delete(:order_id)
      end
      @order.status = "in process"
      @order.number = Order.find(@table.orders.last.id - 1).number + 1
      @order.save!
      redirect_to restaurant_table_confirmation_summary_path(@restaurant, @table, @order), notice: "Your order has been sent succesfully"
    else
      redirect_to "#{restaurant_table_items_path(@restaurant, @table)}#basket", notice: "There is nothing in your basket to be send"
    end
  end

  def destroy
    @order.status = "deleted"
    @order.save!
    redirect_to restaurant_table_orders_path(@restaurant, @table)
    session.delete(:order_id)
  end

  def delivered
    @order.status = "delivered"
    @order.save!
    redirect_to restaurant_dashboard_path(@restaurant)
  end

  def paid
    @order.status = "paid"
    @order.save!
    redirect_to restaurant_dashboard_path(@restaurant)
  end

  def clear_table
    @table.orders.each do |order|
      order.status = "deleted"
      order.number = 0
      order.save!
    end
    redirect_to restaurant_dashboard_path(@restaurant)
  end

  private

  def price_per_table
    total_price = 0
    @orders_to_show.each do |order|
      order.orderlines.each do |orderline|
        total_price += orderline.quantity * orderline.item.price
      end
    end
    total_price
  end

  def set_order
    @order = Order.find(params[:id])

  end

  def set_table
    @table = Table.find(params[:table_id])
  end

end
