class RenameColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :customer_image, :customer_image_id
  end
end
