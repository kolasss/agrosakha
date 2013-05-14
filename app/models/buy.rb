class Buy < ActiveRecord::Base
  belongs_to :count_type
  belongs_to :city
  belongs_to :region
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
  
  attr_accessible :body, :count, :count_type_id, :price, :price_type, :title, :city_id, :region_id, :category_id, :subcategory_id

  validates :title, :presence => true, :length => { :maximum => 100 }
  validates :body, :length => { :maximum => 3000 }
  validates :category_id, :presence => true
  validates :count, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :count_type_id, :presence => true
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  self.per_page = 5
end
