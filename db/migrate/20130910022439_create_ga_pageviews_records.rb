class CreateGaPageviewsRecords < ActiveRecord::Migration
  def change
    create_table :ga_pageviews_records do |t|
      t.string :model_type, :null => false
      t.integer :model_id, :null => false
      t.integer :pageviews, :null => false, :default => 0
      t.integer :unique_pageviews, :null => false, :default => 0

      t.timestamps
    end
  end
end
