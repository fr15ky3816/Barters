class AddIsSoldColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :is_sold, :boolean, default: true, null: false
  end

  def change
    change_column :products, :is_active, :boolean, default: true
  end
end
