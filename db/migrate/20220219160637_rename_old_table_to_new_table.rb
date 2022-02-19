class RenameOldTableToNewTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :foods_inventories, :food_inventories
  end
end
