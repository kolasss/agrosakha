class Subcategory < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :category_id

  validates :name, :presence => true
  validates :category_id, :presence => true
end
