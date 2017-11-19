class TablesController < ApplicationController
  before_action :set_table, only: [:show]
  before_action :set_restaurant, only: [:index, :show]

  def index
    @tables = @restaurant.tables
  end

  def show
  end

  private

  def set_table
    @table = Table.find(params[:id])
  end

end
