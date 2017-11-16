class OrdersController < ApplicationController
  before_action :set_table, only: [:index, :update, :destroy, :clear_table, :status]
  before_action :set_order, only: [:destroy, :status]

  def index
    @orders_not_deleted = @table.orders.where.not(status: 'deleted')
    @orders_pending = @table.orders.where(status: 'pending')
    @orders_in_process = @table.orders.where(status: 'in process')
    @orders_delivered = @table.orders.where(status: 'delivered')
    @orders_paid = @table.orders.where(status: 'paid')
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

  def status
    if @order.status == "in process"
      @order.status = "delivered"
    elsif @order.status == "delivered"
      @order.status = "paid"
    end
    @order.save!
    redirect_to table_orders_path(@table)
  end

  def clear_table
    if @table.orders.any?
      @orders = @table.orders
      @orders.each do |order|
        order.status = "deleted"
        order.save!
      end
    end
    session[:order_number] = 1
    session.delete(:order_id)
    redirect_to table_orders_path(@table), notice: "Table cleared"
  end

  private

  def set_order
    @order = Order.find(params[:id])

  end

  def set_table
    @table = Table.find(params[:table_id])
  end

end
