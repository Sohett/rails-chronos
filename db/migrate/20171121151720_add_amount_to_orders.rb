class AddAmountToOrders < ActiveRecord::Migration[5.1]
  def change
    add_monetize :orders, :amount, currency: { present: false }
  end
end
