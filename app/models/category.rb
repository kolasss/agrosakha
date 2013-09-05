class Category < ActiveRecord::Base
  attr_accessible :name, :default_image, :sort_id

  has_many :subcategories, :dependent => :destroy, :order => "id asc"
  has_many :sells, :dependent => :destroy
  has_many :buys, :dependent => :destroy
  has_and_belongs_to_many :profiles

  validates :name, :presence => true
  validates :default_image, :presence => true
  validates :sort_id, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  default_scope order('sort_id ASC')
end
