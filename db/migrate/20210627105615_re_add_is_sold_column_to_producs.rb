class ReAddIsSoldColumnToProducs < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :is_sold, :boolean, default: false
  end
end
