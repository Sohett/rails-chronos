class Restaurant < ApplicationRecord
  has_many :items
  has_many :tables
  has_many :orders, through: :tables

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
