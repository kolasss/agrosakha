class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :sells, :dependent => :destroy
  has_many :buys, :dependent => :destroy
  has_and_belongs_to_many :profiles
  
  attr_accessible :name, :category_id, :default_image, :sort_id

  validates :name, :presence => true
  validates :category_id, :presence => true
  validates :default_image, :presence => true
  validates :sort_id, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  default_scope order('category_id ASC, sort_id ASC')
end
