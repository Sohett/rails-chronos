class CreateOrderlines < ActiveRecord::Migration[5.1]
  def change
    create_table :orderlines do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
