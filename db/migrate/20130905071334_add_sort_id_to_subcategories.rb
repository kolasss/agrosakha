class AddSortIdToSubcategories < ActiveRecord::Migration
  def change
  	add_column :subcategories, :sort_id, :integer, :null => false, :default => 0
  	add_index :subcategories, :sort_id

  	add_column :categories, :sort_id, :integer, :null => false, :default => 0
  	add_index :categories, :sort_id
  end
end
