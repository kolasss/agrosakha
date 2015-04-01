class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :body
      t.text :body_cache
      t.timestamps
    end
  end
end
