class Region < ActiveRecord::Base
  attr_accessible :name

  has_many :cities, :dependent => :destroy
  has_many :profiles, :dependent => :nullify
  has_many :sells, :dependent => :nullify
  has_many :buys, :dependent => :nullify

  validates :name, :presence => true
end
