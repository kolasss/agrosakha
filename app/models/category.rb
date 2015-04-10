class Category < ActiveRecord::Base
  attr_accessible :name, :default_image, :sort_id

  has_many :subcategories, :dependent => :destroy, :order => "id asc"
  has_many :sells, :dependent => :destroy
  has_many :buys, :dependent => :destroy
  has_and_belongs_to_many :profiles

  before_validation :set_image

  has_attached_file :default_image,
    :styles => {
      :thumb => {:geometry => "100x100>"},
      :large => {:geometry => "500x500>"}
    }

  validates_attachment :default_image,
    :content_type => { :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg'] },
    :size => { :in => 10..300.kilobytes }

  validates :name, :presence => true
  validates :default_image, :presence => true
  validates :sort_id, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  default_scope order('sort_id ASC')

  private
  	def set_image
  		self.default_image_file_name = 'missing.png' if self.default_image.blank?
  		self.default_image.url = '/images/missing/thumb/missing.png' if self.default_image.blank?
  	end
end
