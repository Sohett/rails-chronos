class OrdersController < ApplicationController
  before_action :set_table, only: [:index, :update, :destroy, :clear_table, :delivered, :paid, :price_per_table, :ticket]
  before_action :set_order, only: [:destroy, :delivered, :paid, :ticket]
  before_action :set_restaurant, only: [:index, :update, :destroy, :delivered, :paid, :clear_table, :ticket]

  def index
    @orders_all = @table.orders
    @orders_to_show = @table.orders - @table.orders.where(status: 'deleted') - @table.orders.where(status: 'pending')
    @orders_not_paid = @table.orders.where(paid: false) - @table.orders.where(status: 'deleted') - @table.orders.where(status: 'pending')
    @orders_pending = @table.orders.where(status: 'pending')
    @orders_in_process = @table.orders.where(status: 'in process')
    @orders_delivered = @table.orders.where(status: 'delivered')
    @orders_paid = @table.orders.where(paid: true)
    @total_price = price_per_table
    @index = true
  end

  def update
    @order = Order.find(session[:order_id])
    if session[:order_id]
      session.delete(:order_id)
    end
    @order.time = Time.now
    @order.status = "in process"
    @order.save!
    redirect_to restaurant_table_confirmation_summary_path(@restaurant, @table, @order)
  end

  def destroy
    @order.status = "deleted"
    @order.save!
    redirect_to restaurant_table_orders_path(@restaurant, @table)
    session.delete(:order_id)
  end

  def ticket
    respond_to do |format|
      format.pdf do
        pdf = Prawn::Document.new
        content = []
        content << @restaurant.name.to_s.upcase
        content << " "
        content << "Table number : " + (@order.table.table_number).to_s
        content << "Order passed at " + (@order.time + 60.minutes ).strftime("%H:%M")
        content << " "
        content << "items".upcase
        content << " "
        @order.orderlines.each do |ol|
          content << "- " + ol.item.name.to_s + " x " + ol.quantity.to_s
        end
        pdf.text content.join("\n")
        send_data pdf.render
      end
    end
    @order.printed = true
  end

  def delivered
    @order.status = "delivered"
    @order.save!
    redirect_to restaurant_dashboard_path(@restaurant)
  end

  def paid
    @order.paid = true
    @order.save!
    if params[:format]
      redirect_to restaurant_table_orders_path(@restaurant, @table)
    else
      redirect_to restaurant_dashboard_path(@restaurant)
    end
  end

  def clear_table
    @table.orders.where.not(status:'pending').each do |order|
      order.status = "deleted"
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
