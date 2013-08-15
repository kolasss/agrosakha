class AddDefaultImageToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :default_image, :string
  end
end
