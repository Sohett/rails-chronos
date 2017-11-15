class OrdersController < ApplicationController
  before_action :set_table, only: [:index, :update, :destroy]

  def index
    @orders = @table.orders
  end

  def update
    @order = Order.find(session[:order_id])
    session.delete(:order_id)
    @order.status = "order received"
    @order.save
    
    redirect_to table_orders_path(@table), notice: "your order has been sent succesfully"
  end

  def destroy
    @order = Order.find(params[:id])
    @order.orderlines.each do |orderline|
      orderline.destroy
    end
    @order.destroy
    redirect_to table_orders_path(@table)
  end

  private

  def set_table
    @table = Table.find(params[:table_id])
  end

end
