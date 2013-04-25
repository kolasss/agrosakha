class CountType < ActiveRecord::Base
  attr_accessible :name

  has_many :sells
  has_many :buys

  validates :name, :presence => true
end
