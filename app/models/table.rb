class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :orders

  def to_s
    table_number
  end
end
