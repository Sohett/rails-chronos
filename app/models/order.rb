class Order < ApplicationRecord
  belongs_to :table
  has_many :orderlines

end
