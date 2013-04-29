class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :region

  attr_accessible :address, :desc, :inn, :name, :phone, :city_id, :region_id

end
