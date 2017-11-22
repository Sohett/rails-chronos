class Restaurant < ApplicationRecord
  has_many :items
  has_many :tables
  has_many :orders, through: :tables

  def status_kitchen
    if self.kitchen
      self.kitchen = false
    else
      self.kitchen = true
    end
    self.save!
  end

  def average_order_price
    orders.where(paid: true).average(:amount_cents) / 100.0
  end

  def unpaid_orders_count
    orders.where(paid: false).count
  end

  def list_of_categories
    list = []
    self.items.each do |item|
      unless list.include?(item.category)
        list << item.category
      end
    end
    list
  end
end
