class RemoveColumnFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :custoer_image, :string
  end
end
