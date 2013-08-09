class AddAttachmentImageToBuys < ActiveRecord::Migration
  def self.up
    change_table :buys do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :buys, :image
  end
end
