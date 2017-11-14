class Orderline < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, presence: true
end
