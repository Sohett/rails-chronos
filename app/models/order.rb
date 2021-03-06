class Order < ApplicationRecord
  before_create :set_order_time
  belongs_to :table
  has_many :orderlines
  has_one :restaurant, through: :table

  monetize :amount_cents

  def price_per_order
    price = 0
    self.orderlines.each do |orderline|
      price += orderline.quantity * orderline.item.price
    end
    return price
  end

  def set_order_time
    self.time = Time.now
  end

end
