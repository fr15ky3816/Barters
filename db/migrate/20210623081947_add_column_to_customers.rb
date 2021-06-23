class AddColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :customer_image, :string
  end
end
