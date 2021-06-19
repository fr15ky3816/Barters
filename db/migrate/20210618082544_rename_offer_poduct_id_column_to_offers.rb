class RenameOfferPoductIdColumnToOffers < ActiveRecord::Migration[5.2]
  def change
    rename_column :offers, :offer_poduct_id, :offer_product_id
  end
end
