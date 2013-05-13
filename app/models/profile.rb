class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :region
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subcategories

  attr_accessible :address, :desc, :inn, :name, :phone, :city_id, :region_id, :category_ids, :subcategory_ids

  self.per_page = 5
end
