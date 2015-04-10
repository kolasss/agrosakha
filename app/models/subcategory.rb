class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :sells, :dependent => :destroy
  has_many :buys, :dependent => :destroy
  has_and_belongs_to_many :profiles

  before_validation :set_image

  attr_accessible :name, :category_id, :default_image, :sort_id
  has_attached_file :default_image,
    :styles => {
      :thumb => {:geometry => "100x100>"},
      :large => {:geometry => "500x500>"}
    }

  validates_attachment :default_image,
    :content_type => { :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg'] },
    :size => { :in => 10..300.kilobytes }
  validates :name, :presence => true
  validates :category_id, :presence => true
  validates :default_image, :presence => true
  validates :sort_id, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  default_scope order('category_id ASC, sort_id ASC')

  private
    def set_image
      self.default_image = 'missing.png' if self.default_image.blank?
    end
end
