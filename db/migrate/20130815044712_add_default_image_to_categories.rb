class AddDefaultImageToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :default_image, :string
  end
end
