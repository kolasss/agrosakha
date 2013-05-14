class AddRegionToSell < ActiveRecord::Migration
  def change
  	add_column :sells, :region_id, :integer
    add_index :sells, :region_id
    add_column :buys, :region_id, :integer
    add_index :buys, :region_id
  end
end
