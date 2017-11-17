class Order < ApplicationRecord
  belongs_to :table
  has_many :orderlines
  
  def price_per_order
    price = 0
    self.orderlines.each do |orderline|
      price += orderline.quantity * orderline.item.price
    end
    return price
  end

end

