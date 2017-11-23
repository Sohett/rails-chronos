class AddHorribleIdToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :horrible_id, :string
  end
end
