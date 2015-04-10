class Buy < ActiveRecord::Base
  belongs_to :count_type
  belongs_to :city
  belongs_to :region
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user

  attr_accessible :image, :body, :count, :count_type_id, :price, :price_type, :title, :city_id, :region_id, :category_id, :subcategory_id

  validates :title, :presence => true, :length => { :maximum => 100 }
  validates :body, :length => { :maximum => 3000 }
  validates :category_id, :presence => true
  validates :count, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :count_type_id, :presence => true
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  before_validation :set_image
  self.per_page = 20

  default_scope order('updated_at DESC')

  has_attached_file :image,
    :styles => {
      :thumb => {:geometry => "100x100>"},
      :large => {:geometry => "500x500>"}
    }

  validates_attachment :image,
    :content_type => { :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg'] },
    :size => { :in => 10..300.kilobytes }

    def set_image
      if image.blank?
        if subcategory.nil?
          unless category.default_image_file_name == 'missing.png'
            image_buff = category.default_image
            self.image = image_buff
          else
            self.image_file_name = 'missing.png'
          end
        else
          unless subcategory.default_image_file_name == 'missing.png'
            image_buff = subcategory.default_image
            self.image = image_buff
          else
            self.image_file_name = 'missing.png'
          end
        end
      end
    end
end
