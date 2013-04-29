class Region < ActiveRecord::Base
  attr_accessible :name

  has_many :cities, :dependent => :destroy
  has_many :profiles, :dependent => :nullify

  validates :name, :presence => true
end
