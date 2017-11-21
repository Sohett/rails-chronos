class PaymentsController < ApplicationController
  before_action :set_order, :set_table, :set_restaurant

  def new
  end

  def create
    customer = Stripe::Customer.create(source: params[:stripeToken],email:  params[:stripeEmail])

    charge = Stripe::Charge.create(customer: customer.id, amount: @order.amount_cents, description:  "Payment in restaurant #{@restaurant.name} for order #{@order.id}", currency: @order.amount.currency)

    @order.update(payment: charge.to_json)

    if session[:order_id]
      session.delete(:order_id)
    end
    @order.paid = true
    @order.number = Order.find(@table.orders.last.id - 1).number + 1
    @order.save!
    redirect_to restaurant_table_confirmation_summary_path(@restaurant, @table, @order), notice: "Your order has been sent succesfully"

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to restaurant_table_basket_summary_path(@restaurant, @table), notice: "There was an issue with your payment, you have not been charged! No worries"
  end

  private

  def set_table
    @table = Table.find(params[:table_id])
  end

  def set_order
    @order = Order.where(status: 'pending').find(params[:order_id])
  end
end
