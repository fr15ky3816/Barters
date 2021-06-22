class RemoveColumnFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image1_id, :string
    remove_column :products, :image2_id, :string
    remove_column :products, :image3_id, :string
  end
end
