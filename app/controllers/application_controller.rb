class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
