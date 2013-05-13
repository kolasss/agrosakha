class CreateSubcategoriesProfilesTable < ActiveRecord::Migration
  def up
  	create_table :profiles_subcategories, :id => false do |t|
        t.references :subcategory
        t.references :profile
    end
    add_index :profiles_subcategories, [:subcategory_id, :profile_id]
  end

  def down
  	drop_table :profiles_subcategories
  end
end
