class AddKitchenToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :kitchen, :boolean, default: true
  end
end
