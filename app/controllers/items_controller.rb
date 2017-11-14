class ItemsController < ApplicationController
  def index
    @restaurant = Restaurant.first
    @items = @restaurant.items
    @items_starters = @items.where(category: 'starters')
    @items_burgers = @items.where(category: 'burgers')
    @items_sides = @items.where(category: 'sides')
    @items_drinks = @items.where(category: 'drinks')
  end
end
