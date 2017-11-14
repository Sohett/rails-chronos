class TablesController < ApplicationController
  before_action :set_table, only: [:show]

  def index
    @tables = Table.all
  end

  def show
  end

  private

  def set_table
    @table = Table.find(params[:id])
  end
end
