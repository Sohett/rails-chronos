class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end
end
