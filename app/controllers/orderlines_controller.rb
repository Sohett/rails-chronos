class OrderlinesController < ApplicationController
  before_action :set_table, only: [:new, :create]

  def new
    @orderline = Orderline.new
    @items = @table.restaurant.items
    @order = current_order
  end

  def create
    @order = current_order
    @orderline = Orderline.new(orderline_params)
    @orderline.order = @order
    @orderline.save
    redirect_to new_table_orderline_path(@table)
  end

  private

  def orderline_params
    params.require(:orderline).permit(:quantity, :item_id)
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

  def set_table
    @table = Table.find(params[:table_id])
  end
end
