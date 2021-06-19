class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :order_product_id
      t.integer :order_trade_product_id
      t.integer :order_status

      t.timestamps
    end
  end
end
