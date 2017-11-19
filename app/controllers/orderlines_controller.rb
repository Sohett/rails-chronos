class OrderlinesController < ApplicationController
  before_action :set_table, only: [:create, :cancel_item, :increase_item, :decrease_item]
  before_action :set_restaurant, only: [:create, :cancel_item, :increase_item, :decrease_item]

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
    redirect_to "#{restaurant_table_items_path(@restaurant, @table)}#basket"
  end

  def increase_item
    @orderline = Orderline.find(params[:id])
    @orderline.quantity += 1
    @orderline.save
    redirect_to restaurant_table_basket_summary_path(@restaurant, @table)
  end

  def decrease_item
  @order = current_order
  @orderline = Orderline.find(params[:id])
    if @orderline.quantity > 1
      @orderline.quantity -= 1
      @orderline.save
      redirect_to restaurant_table_basket_summary_path(@restaurant, @table)
    elsif @order.orderlines.count > 1
      @orderline.destroy
      redirect_to restaurant_table_basket_summary_path(@restaurant, @table)
    else
      @orderline.destroy
      redirect_to "#{restaurant_table_items_path(@restaurant, @table)}#basket"
    end
  end

  def cancel_item
    @orderline = Orderline.find(params[:id])
    @orderline.destroy
    redirect_to restaurant_table_basket_summary_path(@restaurant, @table)
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
