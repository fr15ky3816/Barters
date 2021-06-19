class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :trade_product_id

      t.timestamps
    end
  end
end
