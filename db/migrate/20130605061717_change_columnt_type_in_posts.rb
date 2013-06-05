class ChangeColumntTypeInPosts < ActiveRecord::Migration
  def up
    change_column :posts, :body, :text
    change_column :posts, :body_cache, :text
	end
	def down
    change_column :posts, :body, :string
    change_column :posts, :body_cache, :string
	end
end
