class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :subcategories, :dependent => :destroy
  has_many :sells, :dependent => :destroy
  has_many :buys, :dependent => :destroy
  has_and_belongs_to_many :profiles

  validates :name, :presence => true
end
