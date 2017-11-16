class Restaurant < ApplicationRecord
  has_many :items
  has_many :tables
  has_many :orders, through: :tables
end
