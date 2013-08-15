class Category < ActiveRecord::Base
  attr_accessible :name, :default_image

  has_many :subcategories, :dependent => :destroy, :order => "id asc"
  has_many :sells, :dependent => :destroy
  has_many :buys, :dependent => :destroy
  has_and_belongs_to_many :profiles

  validates :name, :presence => true
  validates :default_image, :presence => true
end
