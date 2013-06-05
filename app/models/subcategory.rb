class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :sells, :dependent => :nullify
  has_many :buys, :dependent => :nullify
  has_and_belongs_to_many :profiles
  
  attr_accessible :name, :category_id

  validates :name, :presence => true
  validates :category_id, :presence => true

  default_scope order('category_id ASC')
end
