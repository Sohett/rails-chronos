class OrderlinesController < ApplicationController
  before_action :set_table, only: [:new, :create, :cancel_item, :increase_item, :decrease_item]

  def new
    @orderline = Orderline.new
    @items = @table.restaurant.items
    @order = current_order
  end

  def create
    @order = current_order
    item = Item.find(params[:orderline][:item])
    list = item_in_list
    if list.include?(item.id)
      @orderline = @order.orderlines.where(item_id: "#{item.id}").first
      @orderline.quantity += 1
    else
      @orderline = Orderline.new
      @orderline.item = item
      @orderline.order = @order
      @orderline.quantity = 1
    end
    @orderline.save!
    redirect_to "#{table_items_path(@table)}#basket"
  end

  def increase_item
    @orderline = Orderline.find(params[:id])
    @orderline.quantity += 1
    @orderline.save
    redirect_to "#{table_items_path(@table)}#basket"
  end

  def decrease_item
  @orderline = Orderline.find(params[:id])
    if @orderline.quantity > 1
      @orderline.quantity -= 1
      @orderline.save
    else
      @orderline.destroy
    end
    redirect_to "#{table_items_path(@table)}#basket"
  end

  def cancel_item
    @orderline = Orderline.find(params[:id])
    @orderline.destroy
    redirect_to "#{table_items_path(@table)}#basket"
  end

  private

  def item_in_list
    list = []
    @order = current_order
    @order.orderlines.each do |orderline|
      list << orderline.item.id
    end
    return list
  end

  def orderline_params
    params.require(:orderline).permit(:quantity, :item)
  end

  def current_order
    Order.find(session[:order_id])
  end

  def set_table
    @table = Table.find(params[:table_id])
  end
end
