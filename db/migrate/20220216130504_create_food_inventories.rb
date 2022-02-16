class CreateFoodInventories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :inventories, :foods do |t|
      t.index :inventory_id
      t.index :food_id
      t.integer :quantity

      t.timestamps
    end
  end
end
