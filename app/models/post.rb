class Post < ActiveRecord::Base
  attr_accessible :body, :title

  validates :title, :presence => true
  validates :body, :presence => true

  slice :body, :as => :shorten, :slice => {:maximum => 300, :limit => 1, :text_break => "..."}, :cache_to => :body_cache
end
