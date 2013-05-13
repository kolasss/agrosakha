class AddBodyCacheToPost < ActiveRecord::Migration
  def change
    add_column :posts, :body_cache, :string
  end
end
