class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.boolean :is_active
      t.string :image1_id
      t.string :image2_id
      t.string :image3_id
    
      t.timestamps
    end
  end
end
