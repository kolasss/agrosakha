class CreateCategoriesProfilesTable < ActiveRecord::Migration
  def up
  	create_table :categories_profiles, :id => false do |t|
        t.references :category
        t.references :profile
    end
    add_index :categories_profiles, [:category_id, :profile_id]
  end

  def down
  	drop_table :categories_profiles
  end
end
