class City < ActiveRecord::Base
  belongs_to :region
  has_many :sells, :dependent => :nullify
  has_many :buys, :dependent => :nullify
  has_many :profiles, :dependent => :nullify
  
  attr_accessible :name, :region_id

  validates :name, :presence => true
  validates :region_id, :presence => true
end
