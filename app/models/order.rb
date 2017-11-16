class Order < ApplicationRecord
  belongs_to :table
  has_many :orderlines

  def quantity
    result = 0
    self.orderlines.each do |orderline|
      result += orderline.quantity
    end
    result
  end

  def total_price
    total_price = 0
    self.orderlines.each do |orderline|
      price = orderline.quantity * orderline.item.price
      total_price += price
    end
    return total_price
  end
end
