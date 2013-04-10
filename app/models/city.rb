class City < ActiveRecord::Base
  belongs_to :region
  attr_accessible :name, :region_id

  validates :name, :presence => true
  validates :region_id, :presence => true
end
