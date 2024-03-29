class Restaurant < ApplicationRecord

  extend FriendlyId
  friendly_id :create_horrible_id, use: :slugged

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
    order_by_day = orders.group_by_day(:time, week_start: :mon)
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

  private

  def create_horrible_id
    SecureRandom.uuid
  end

end
