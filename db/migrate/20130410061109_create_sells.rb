class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.string :title, :null => false
      t.string :body
      t.float :count, :null => false, :default => 0
      t.references :count_type, :null => false
      t.float :price, :null => false, :default => 0
      t.integer :price_type, :null => false, :default => 1
      t.references :city
      t.references :category, :null => false
      t.references :subcategory
      t.references :user, :null => false

      t.timestamps
    end
    add_index :sells, :city_id
    add_index :sells, :category_id
    add_index :sells, :subcategory_id
    add_index :sells, :user_id
  end
end
