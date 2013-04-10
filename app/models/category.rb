class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :subcategories

  validates :name, :presence => true
end
