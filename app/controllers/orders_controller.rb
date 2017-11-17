class OrdersController < ApplicationController
  before_action :set_table, only: [:index, :update, :destroy, :clear_table, :delivered, :paid, :price_per_table]
  before_action :set_order, only: [:destroy, :delivered, :paid]

  def index
    @orders_all = @table.orders
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
      session.delete(:order_id)
      @order.status = "in process"
      @order.save!
      session[:order_number] += 1
      redirect_to "#{table_items_path(@table)}#basket", notice: "Your order has been sent succesfully"
    else
      redirect_to "#{table_items_path(@table)}#basket", notice: "There is nothing in your basket to be send"
    end
  end

  def destroy
    @order.status = "deleted"
    @order.save!
    redirect_to table_orders_path(@table)
    session.delete(:order_id)
  end

  def delivered
    @order.status = "delivered"
    @order.save!
    redirect_to dashboard_path
  end

  def paid
    @order.status = "paid"
    @order.save!
    redirect_to dashboard_path
  end

  def clear_table
    @orders = @table.orders
    @orders.each do |order|
      order.status = "deleted"
      order.save!
    end
    session[:order_number] = 1
    session.delete(:order_id)
    redirect_to dashboard_path, notice: "Table cleared"
  end

  private

  def price_per_table
    total_price = 0
    @table.orders.each do |order|
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
