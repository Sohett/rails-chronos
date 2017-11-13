class ItemsController < ApplicationController
  def index
    @restaurant = Restaurant.first
    @items = @restaurant.items
  end
end
