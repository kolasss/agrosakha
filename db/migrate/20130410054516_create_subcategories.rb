class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name, :null => false
      t.references :category

      t.timestamps
    end
    add_index :subcategories, :category_id
  end
end
