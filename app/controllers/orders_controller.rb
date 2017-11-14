class OrdersController < ApplicationController
  before_action :set_table, only: [:index, :update]

  def index
    @orders = @table.orders
  end

  def update
    @order = Order.find(session[:order_id])
    session.delete(:order_id)
    @order.status = "order send"
    @order.save
    redirect_to table_orders_path(@table), alert: "your order has been sent succesfully"
  end

  private

  def set_table
    @table = Table.find(params[:table_id])
  end

end
