class RenameProductIdColumnToOffers < ActiveRecord::Migration[5.2]
  def change
    rename_column :offers, :product_id, :offer_product_id
  end
end
