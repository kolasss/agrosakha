class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :sells, :dependent => :destroy
  has_many :buys, :dependent => :destroy
  
  attr_accessible :name, :category_id

  validates :name, :presence => true
  validates :category_id, :presence => true
end
