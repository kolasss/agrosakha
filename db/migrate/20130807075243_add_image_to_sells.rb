class AddImageToSells < ActiveRecord::Migration
  def self.up
    add_attachment :sells, :image
  end

  def self.down
    remove_attachment :sells, :image
  end
end
