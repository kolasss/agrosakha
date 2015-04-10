class AddAttachToSubcategories < ActiveRecord::Migration
  def change
    rename_column :subcategories, :default_image, :default_image_file_name
    add_column :subcategories, :default_image_content_type, :string
    add_column :subcategories, :default_image_file_size, :integer
    add_column :subcategories, :default_image_updated_at, :datetime
  end
end
