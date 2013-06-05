class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :region
  has_and_belongs_to_many :categories, :order => "id asc"
  has_and_belongs_to_many :subcategories, :order => "id asc"

  attr_accessible :address, :desc, :inn, :name, :phone, :city_id, :region_id, :category_ids, :subcategory_ids

  validates :name, :presence => true, :length => { :maximum => 100 }
  validates :user_id, :presence => true

  self.per_page = 5
end
