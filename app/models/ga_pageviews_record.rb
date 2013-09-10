class GaPageviewsRecord < ActiveRecord::Base
  attr_accessible :model_id, :model_type, :pageviews, :unique_pageviews

  validates :model_id, :presence => true
  validates :model_type, :presence => true
  validates :pageviews, :presence => true
  validates :unique_pageviews, :presence => true

  default_scope order('updated_at DESC')
end
